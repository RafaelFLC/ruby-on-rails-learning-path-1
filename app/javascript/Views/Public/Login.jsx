import React, { useContext, useState } from 'react'
import axios from 'axios'

import Errors from '../../Modules/Errors'
import Password from '../../Modules/UI/Password'
import { UserContext } from '../../Context/UserContext'

function Login() {

  const {authenticate} = useContext(UserContext)
  const [loginUser, setLoginUser] = useState({
    username: '', 
    password: '', 
    errors: []
  })

  const onChange = ({target}) => setLoginUser(user => user = { ...user, [target.id] : target.value })

  const submit = async e => {
    e.preventDefault()
    const payload = await axios.post('api/auth/login', loginUser)

    if (payload.data.result)
      return authenticate(payload.data)

    setLoginUser( u => u = { ...u, errors: payload.data.errors} )
  }

  return (
    <div className="flex flex-col h-full w-full m-2 self-center align-middle">
        <div className="h-1/3">
            <Errors list={loginUser.errors} />
        </div>

        <form className="flex-1" onSubmit={submit} >
            <div className="flex flex-col my-4">
                <input value={loginUser.username} onChange={onChange} 
                    placeholder="Username" type="text" id="username" 
                    className="p-2 rounded-lg shadow-lg" />
            </div>
            
            <Password label="Password" value={loginUser.password} onChange={onChange} />
            
            <div className="flex flex-col">
                <button type='submit' className="m-2 p-2 rounded-lg shadow-lg bg-blue-300"
                    onClick={submit}
                >
                    Submit
                </button>
            </div>
        </form>
    </div>
  )
}

export default Login
