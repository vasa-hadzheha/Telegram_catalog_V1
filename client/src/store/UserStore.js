import {makeAutoObservable} from 'mobx'

// We use constructor when we make object of class
export default class UserStore {
    constructor() {
        this._isAuth = false
        this._user = {}
        // func from mobx which follow the changes of variables (this.) and rerender them
        makeAutoObservable(this)
    }
    //There are actions (this is function which change state)
    setIsAuth(bool) {
        this._isAuth = bool
    }

    setUser(user) {
        this._user = user
    }

    // This is computed func or(getters) to get variables
    get isAuth() {
        return this._isAuth
    }

    get user() {
        return this._user
    }
}