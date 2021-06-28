import Web3 from 'web3'
import {
  web3Loaded,  
  web3AccountLoaded,
  tokenLoaded,
  exchangeLoaded
} from './actions'
import Token from '../abis/Token.json'
import Exchange from '../abis/Exchange.json'

export const loadWeb3 = async (dispatch) => {
    if(typeof window.ethereum!=='undefined'){
      const web3 = new Web3(window.ethereum)
      dispatch(web3Loaded(web3))
      return web3
    } else {
      window.alert('Please install MetaMask')
      window.location.assign("https://metamask.io/")
    }
  }