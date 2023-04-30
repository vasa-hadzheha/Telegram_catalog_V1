import { Card} from "react-bootstrap";
import { Context } from '../index';
import { observer } from 'mobx-react-lite';
import React, {useContext} from 'react';


const BrandBar = observer(() => {
    const {device} = useContext(Context)
    return (
        
        <div className="d-flex ">
            {device.brands.map(brand => 
                <Card
                    style={{cursor:'pointer'}}
                    key={brand.id}
                    className="p-3"
                    onClick={() => device.setSelectedBrand(brand)}
                    border={brand.id === device.selectedBrand.id ? 'primary' : 'light'}
                >
                    {brand.name}
            </Card>
            )}
        </div>
    );
});

export default BrandBar;