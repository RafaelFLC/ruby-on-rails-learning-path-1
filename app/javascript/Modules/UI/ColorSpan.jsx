import React from 'react'

function ColorSpan ({ children, hideOnSm, color }) {
  hideOnSm = hideOnSm ?? false 
  color = color ?? 'red'

  return (
    <span className={`text-${color}-500 ${ hideOnSm ? "hidden md:inline-block" : "" }`}>
        {children}
    </span>
  )
}

export default ColorSpan