import React from 'react'
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'

import LoginLayout from '../Views/Layouts/Login'
import Welcome from '../Views/Public/Welcome'

export default function PublicRoutes () {
  return (
    <BrowserRouter>
      <LoginLayout>
        <Routes>
          <Route path='/' element={<Welcome/>} />
          <Route path='*' element={<Navigate to='/' />} />
        </Routes>
      </LoginLayout>
    </BrowserRouter>
  )
}

