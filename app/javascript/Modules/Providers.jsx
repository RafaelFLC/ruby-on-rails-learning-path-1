import React from 'react'

import { AppProvider } from '../Context/AppContext'
import { ThemeProvider } from '../Context/ThemeContext'
import { UserProvider } from '../Context/UserContext'

function Providers({children}) {
  return (
    <AppProvider>
      <ThemeProvider>
        <UserProvider>
          {children}
        </UserProvider>
      </ThemeProvider>
    </AppProvider>
  )
}

export default Providers
