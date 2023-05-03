const uuid = require('uuid')
const path = require('path')
const {Device, DeviceInfo} = require('../models/models')
const ApiError = require('../error/ApiError')

class DeviceController {
    async create(req, res, next){
        try {
            let {name, price, brandId, typeId, info} = req.body
            const {img} = req.files
            let fileName = uuid.v4() + ".jpg"
            img.mv(path.resolve(__dirname,"..","static",fileName))

            const device = await Device.create({name, price, brandId, typeId, img:fileName})
            
            if(info) {
                info = JSON.parse(info)
                info.forEach(i => 
                DeviceInfo.create({
                    title: i.title,
                    description: i.description,
                    deviceId: device.id
                })    
                );
            }
    
            return res.json(device)
        } catch (e) {
            next(ApiError.badRequest(e.message))
        }
    }
    async getAll(req, res){
        let {brandId, typeId, limit, page} = req.query
        page = page || 1
        limit = limit || 9
        let offset = page * limit - limit

        let devices;
        if(!brandId && !typeId){
            devices = await Device.findAndCountAll({limit, offset})
        }
        if(brandId && !typeId){
            devices = await Device.findAndCountAll({where:{brandId}, limit, offset})
        }
        if(!brandId && typeId){
            devices = await Device.findAndCountAll({where:{typeId}, limit, offset})
        }
        if(brandId && typeId){
            devices = await Device.findAndCountAll({where:{typeId, brandId}, limit, offset})
        }
        return res.json(devices)
    }

    async getAllNoLimit(req, res) {
        let { brandId, typeId } = req.query;
        
        let devices;
        if (!brandId && !typeId) {
          devices = await Device.findAll();
        }
        if (brandId && !typeId) {
          devices = await Device.findAll({ where: { brandId } });
        }
        if (!brandId && typeId) {
          devices = await Device.findAll({ where: { typeId } });
        }
        if (brandId && typeId) {
          devices = await Device.findAll({ where: { typeId, brandId } });
        }
      
        return res.json(devices);
      }

    async getOne(req, res){
        const {id} = req.params
        const device = await Device.findOne (
            {
                where: {id},
                include: [{model: DeviceInfo, as: 'info'}]
            },
        )
            return res.json(device)  
    }

    async update(req, res, next) {
        try {
          const { id } = req.params;
          const { name, price, info } = req.body;
      
          // Check if device with given id exists
          const device = await Device.findOne({ where: { id } });
          if (!device) {
            return res.status(404).json({ message: "Device not found" });
          }
      
          // Update device's name and price
          device.name = name;
          device.price = price;
      
          // Update device info records
          if (info) {
            await Promise.all(
              info.map(async i => {
                const deviceInfo = await DeviceInfo.findOne({ where: { id: i.id, deviceId: id } });
                if (deviceInfo) {
                  deviceInfo.title = i.title;
                  deviceInfo.description = i.description;
                  await deviceInfo.save();
                }
              })
            );
          }
      
          // Save the updated device
          await device.save();
      
          return res.json(device);
        } catch (e) {
          next(ApiError.badRequest(e.message));
        }
      }
    
      async delete(req, res, next) {
        try {
          const { id } = req.params;
    
          const device = await Device.findByPk(id);
          if (!device) {
            throw ApiError.notFound(`Device with id ${id} was not found.`);
          }
    
          await device.destroy();
    
          return res.json({ message: `Device with id ${id} was deleted.` });
        } catch (e) {
          next(ApiError.badRequest(e.message));
        }
      }
}

module.exports = new DeviceController()