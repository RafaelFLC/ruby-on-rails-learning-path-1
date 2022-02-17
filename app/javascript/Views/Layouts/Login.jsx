import React, { useContext } from 'react'

import { AppContext } from '../../Context/AppContext'

function LoginLayout ({children}) {

    const {state} = useContext(AppContext)

    return (
        <div className="p-4 w-full h-full flex flex-col ">
            <div className="h-10 p-5 justify-center align-middle self-center">
                {state.icon}
            </div>
            <div className="flex flex-1 w-full align-middle">
                {children}
            </div>
            <div className="h-5">
                @Wizeline By rlopez
            </div>
        </div>
    )
}

export default LoginLayout
