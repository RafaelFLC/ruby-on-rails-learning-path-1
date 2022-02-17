import React, { createContext, useState, useMemo, useEffect } from 'react'

import * as Auth from './AuthContext'

export const UserContext = createContext()
export const UserProvider = ({children}) => {
  const [user, setUser] = useState()
  
  const authenticate = data => setUser(Auth.authenticate(data))
 
  const unauthenticate = () => setUser(Auth.unauthenticate())

  const isAuthenticated = () => {
    if (user)
      return user

      const isUserAuth = Auth.isAuthenticated() 

      if (!isUserAuth)
        return false 

      useEffect( () => setUser(isUserAuth), [] )

      return true
  }

  const valueProvider = useMemo( () => ({user, authenticate, isAuthenticated, unauthenticate}), [user, setUser])

  return (
    <UserContext.Provider value={valueProvider}>
      {children}
    </UserContext.Provider>
  )
}