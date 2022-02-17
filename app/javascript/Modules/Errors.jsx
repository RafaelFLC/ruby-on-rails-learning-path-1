import React from 'react'
import ErrorSpan from './UI/ErrorSpan'

function Errors({list}) {

  let _errors = []

  for (let i in list)
    _errors.push( <ErrorSpan msg={list[i]} /> )

  return _errors
}

export default Errors