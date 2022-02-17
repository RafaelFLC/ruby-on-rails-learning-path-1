import React, { createContext, useMemo, useState, useEffect } from 'react'

export const ThemeContext = createContext()
export const ThemeProvider = ({children}) => {

  const [theme, setTheme] = useState('dark')

  useEffect( async () => {
    let isDark = (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches))
    let localStorageTheme = await isDark ? 'light' : 'dark'
    document.documentElement.classList.add(localStorageTheme)
    setTheme(localStorageTheme)
  })

  const toggle = () => {
    let choosedTheme = theme == 'dark' ? 'light' : 'dark'
    localStorage.theme = choosedTheme 
    document.documentElement.classList.remove(theme)
    document.documentElement.classList.add(choosedTheme)
    setTheme(choosedTheme)
  }

  const themeBtn = () => {
    return (
      <button onClick={toggle} className="mx-5">
          { theme == 'dark' ? 
              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
              </svg> : 
              <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
              </svg> 
          }
      </button>
  )
  }

  const valueProvider = useMemo( () => ({theme, toggle, themeBtn}), [theme, setTheme] )

  return (
    <ThemeContext.Provider value={valueProvider}>
      { children }
    </ThemeContext.Provider>
  )
}