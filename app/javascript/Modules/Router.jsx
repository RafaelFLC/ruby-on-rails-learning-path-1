import React, {useContext} from 'react'

import { UserContext } from '../Context/UserContext'
import PublicRoutes from '../Routes/PublicRoutes'
import UserRoutes from '../Routes/UserRoutes'

function Router() {
  const {isAuthenticated} = useContext(UserContext)
  return isAuthenticated() ? <UserRoutes/> : <PublicRoutes />
}

export default Router
