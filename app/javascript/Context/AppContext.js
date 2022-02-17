import React, { createContext, useEffect, useMemo, useState } from 'react'
import ColorSpan from '../Modules/UI/ColorSpan'

export const AppContext = createContext()
export const AppProvider = ({children}) => {

  const getIcon = () => {
    return (
      <span className="text-4xl">
        <ColorSpan color='red'>P</ColorSpan>
        <ColorSpan color='gray' hideOnSm={true}>oke</ColorSpan>
        <ColorSpan color='red'>W</ColorSpan>
        <ColorSpan color='gray' hideOnSm={true}>ize</ColorSpan>
    </span>
    )
  }

  const [state, setState] = useState({
    title : 'Pokewize', 
    icon : getIcon()
  })

 const changeTitle = title => {
   
   useEffect( () => setState( s => s = {...s, title}), [] ) 
  }

 const valueProvider = useMemo(() => ({state, changeTitle}), [state, setState])

  return (
    <AppContext.Provider value={valueProvider}> 
      { children }
    </AppContext.Provider>
  )

}