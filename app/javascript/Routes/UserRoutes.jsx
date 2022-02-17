import React from 'react'
import { BrowserRouter, Routes, Route } from 'react-router-dom'

import UserLayout from '../Views/Layouts/User'
import Home from '../Views/Home'
import Search from '../Views/Search'

function UserRoutes () {
  return (
    <BrowserRouter>
      <UserLayout>
        <Routes>
          <Route path='/' exact element={<Home/>} />
          <Route path='/search' element={<Search/>} />
          <Route path='*' element={<span>Not found</span>} />
        </Routes>
      </UserLayout>
    </BrowserRouter>
      
  )
}

export default UserRoutes