import React, { useState } from 'react'
import axios from 'axios'

import Password from '../../Modules/UI/Password'
import Errors from '../../Modules/Errors'

function SignIn (props) {

  const [user, setUser] = useState({
    username: '', 
    name: '', 
    lastname: '', 
    password: '', 
    password_confirmation: '', 
    errors: []
  })

  const onChange = ({target}) => setUser(u => u = { ...u, [target.id] : target.value })

  const submit = async e => {
    e.preventDefault() 
    const payload = await axios.post('api/users', user)
    
    if (payload.data.result)
      return console.log( payload.data)

    setUser( u => u = { ...u, errors: payload.data.errors} )

  }

  const showErrors = () => {
    let _errors = []

    for ( let i in user.errors ) 
      _errors.push( <Errors list={user.errors[i]}/> ) 
    
    return _errors
  }

  return (
    <div className="flex flex-col h-full w-full m-2 self-center align-middle">

      <div className="h-1/3">
        { showErrors() }
      </div>

      <form className="flex-1" onSubmit={submit}>
        <div className="flex flex-col my-4">
            <input placeholder="Username" type="text" id="username" className="p-2 rounded-lg shadow-lg"
                value={user.username} onChange={onChange}
            />
        </div>
        <div className="flex flex-col my-4">
          <input value={user.name} onChange={onChange} 
              placeholder="Name" type="text" id="name" 
              className="p-2 rounded-lg shadow-lg" />
        </div>
        <div className="flex flex-col my-4">
          <input value={user.lastname} onChange={onChange} 
              placeholder="lastame" type="text" id="lastname" 
              className="p-2 rounded-lg shadow-lg" />
        </div>
    
        <Password label="password" value={user.password} onChange={onChange}/>
        <Password id="password_confirmation" label="confirm password" value={user.passwordConfirm} onChange={onChange}/>
    
        <div className="flex flex-col">
            <button className="m-2 p-2 rounded-lg shadow-lg bg-blue-300" onClick={submit}>
                Submit
            </button>
        </div>
      </form>

    </div>
  )
}

export default SignIn
