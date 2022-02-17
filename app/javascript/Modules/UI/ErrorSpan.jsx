import React from 'react'
import BtnClose from './Buttons/IconBtn/BtnClose'

function ErrorSpan(props) {
  return (
    <span className='flex justify-between mt-2 p-2 bg-red-400 rounded-lg text-white'>
      <span>{props.msg}</span>
      <BtnClose size='sm'/>
    </span>
  )
}

export default ErrorSpan