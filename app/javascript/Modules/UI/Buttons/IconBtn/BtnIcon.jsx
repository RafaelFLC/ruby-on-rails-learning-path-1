import React from 'react'

function BtnIcon ({children, className, onClick, shadow, size}) {
  size = size ?? 'md' 
  shadow = shadow ? '"shadow-md bg-gray-100 dark:bg-gray-500"' : '' 

  const getSize = () => {
    switch (size) {
      case 'md' :
        return 'm-2 p-2 h-10'
      case 'lg' : 
        return 'm-4 p-2 h-10'
      case 'sm' : 
        return 'm-1 h-5'
    }
  }

  return (
    <button onClick={onClick} className={`${getSize()} rounded-lg dark:text-gray-500 ${shadow} ${className??''}`}>
      <span>{children}</span>
    </button>
  )
}

export default BtnIcon