import React, { useContext } from 'react';
import {Route, Routes} from 'react-router-dom'
import NotFound from '../pages/NotFound';
import { authRoutes, publicRoutes } from '../routes';
import { Context } from '../index';
import { observer } from 'mobx-react-lite';

const AppRouter = observer(() => {
    const {user} = useContext(Context)

    return (
    <Routes>
        {user.isAuth && authRoutes.map(({path, Component}) =>
            <Route key={path} path={path} exact element={<Component/>}/>
        )}
        {publicRoutes.map(({path, Component}) =>
            <Route key={path} path={path} exact element={<Component/>}/>
        )}
        <Route path="*" element={<NotFound/>}/>
    </Routes>
    );
});

export default AppRouter;