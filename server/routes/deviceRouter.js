const Router = require('express')
const router = new Router()
const deviceController = require('../controllers/deviceController')

// Create a new device
router.post('/',deviceController.create)

// Get all devices
router.get('/',deviceController.getAll)

//Get whole database elements
router.get('/getAll',deviceController.getAllNoLimit)

// Get a single device by ID
router.get('/:id',deviceController.getOne)

// Update a device by ID
router.put('/:id', deviceController.update)

// Delete a device by ID
router.delete('/:id', deviceController.delete)

module.exports = router