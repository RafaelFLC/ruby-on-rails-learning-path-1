import Cookies from 'universal-cookie'
import jwt_decode from 'jwt-decode'

const cookies = new Cookies()

const authenticate = data => {
  console.log(data)
  cookies.set('token', data.token)
  return decode(data.token)
}

const unauthenticate = () => {
  cookies.remove('token')
  return null 
}

const isAuthenticated = () => {
  let t = cookies.get('token')
  return (!!t) ?  decode(t) : false
}

const decode = t => {
  return { ...jwt_decode(t), token: t }
}

export {
  decode, 
  authenticate, 
  unauthenticate, 
  isAuthenticated
}