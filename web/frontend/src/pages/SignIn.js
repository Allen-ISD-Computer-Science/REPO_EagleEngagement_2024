import * as React from "react";

import logo from '../logo.svg';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEye, faSignIn, faUser } from '@fortawesome/free-solid-svg-icons'

function SignInPage(props) {

    const [email, setEmail] = React.useState("");
    const [password, setPassword] = React.useState("");

    const submitLogin = async () => {
	const hash = btoa(email + ":" + password);
        const headers = { 'Authorization': `Basic ${hash}` };
	
	const res = await fetch("./login", { method: "POST", headers });
	console.log(res);
    }
    
  return (
      <form
	  action="./login"
	  method="/post"
	  className="justify-center items-center bg-neutral-200 min-h-[100vh] flex flex-col px-16 py-11 max-md:px-5"
      >
      <span className="shadow-sm bg-blue-950 flex w-[650px] max-w-full flex-col mb-5 pl-12 pr-8 pb-2.5 rounded-2xl max-md:px-5 text-white">
        <img
            src={logo}
            alt="Eagle Engagement Logo"
            className="h-40 mb-[-80px]"
        />
        <div className="justify-center items-center self-stretch flex flex-col mt-11 px-16 max-md:max-w-full max-md:mt-10 max-md:px-5">
          <div className="flex max-w-full flex-col items-center">
            <FontAwesomeIcon icon={faSignIn} size="4x" />
            <span className="text-center text-5xl font-bold whitespace-nowrap items-stretch self-stretch mt-5 pb-7 px-3 max-md:text-4xl">
              Welcome!
            </span>
            <span className="text-xl max-md:mb-4 max-md:text-l">
                Sign into your account
            </span>
          </div>
        </div>
        <div>
            <span className="text-2xl max-md:text-xl">Email</span>
            <div class="flex items-center border-b border-white py-2 px-4 text-xl max-md:text-l">
                <input
		    className="appearance-none bg-transparent border-none w-full placeholder-white text-gray-100 mr-3 py-1 leading-tight focus:outline-none"
		    type="email"
		    placeholder=" "
		    aria-label="Email"
		    value={email}
		    onChange={(e) => setEmail(e.target.value)}
		/>
                <FontAwesomeIcon icon={faUser} size="m" />
            </div>
        </div>
        <div className="mt-5">
            <span className="text-2xl max-md:text-xl">Password</span>
            <div class="flex items-center border-b border-white py-2 px-4 text-xl max-md:text-l">
                <input
		    className="appearance-none bg-transparent border-none w-full placeholder-white text-gray-100 mr-3 py-1 leading-tight focus:outline-none"
		    type="password"
		    placeholder=""
		    aria-label="Password"
		    value={password}
		    onChange={(e) => setPassword(e.target.value)}
		/>
                <button id="togglePassword">
                    <FontAwesomeIcon icon={faEye} size="m" />
                </button>
            </div>
        </div>
          <button
	      onClick={submitLogin}
	      type="button"
	      className="text-center text-3xl font-semibold whitespace-nowrap justify-center items-center bg-blue-900 self-center w-[50%] max-w-full mt-11 px-16 py-2 rounded-xl max-md:text-2xl max-md:mt-10 max-md:px-5"
	  >
          Login
        </button>
        <div className="text-center text-2xl self-center mt-11 leading-20 max-md:text-xl max-md:mt-10">
            <span>Don't Have an Account? <a className="underline" href={process.env.PUBLIC_URL + "/signup"}>Click</a></span>
          <br />
            <span>Forgot Your Password? <a className="underline" href={process.env.PUBLIC_URL + "/forgotpassword"}>Click</a></span>
        </div>
      </span>
    </form>
  );
}

export default SignInPage;
