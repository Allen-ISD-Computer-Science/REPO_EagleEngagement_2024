import * as React from "react";

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEye, faEyeSlash, faCheck, faUser } from '@fortawesome/free-solid-svg-icons'


function VerifyPage(props) {
    const [password, setPassword] = React.useState("");
    const [passwordConfirm, setPasswordConfirm] = React.useState("");
    const [passwordType, setPasswordType] = React.useState("password");

      const [errorText, setErrorText] = React.useState("");

  /**
   * @param {String} email
   * @returns {Boolean}
   */
    const validateInfo = (email, password, passwordConfirm) => {
    if (email !== "" && (!email.includes("@") || !email.includes(".") || email.split("@").pop().length < 2 || email.split(".").pop().length < 2)) {
      setErrorText("Invalid email.");
      return false;
    }

      if (password != passwordConfirm) {
	  setErrorText("Passwords do not match.");
	  return false;
      }

    setErrorText("");
    return true;
  }

    const canVerify = () => {
	if (!validateInfo(email, password, passwordConfirm)) return false;
	
	if (email === "") {
	    setErrorText("Email cannot be empty.");
	    return false;
	}
	
	return true;
    }

  const submitVerify = async () => {
      if (!canVerify()) return;

      const body = {
	  email: email.toLowerCase(),
	  token: token,
	  password: password,
	  passwordConfirm: passwordConfirm
      }

      const res = await fetch("./verify", { method: "POST", headers: {"content-type": "application/json"},  body: JSON.stringify(body) });
      console.log(res);
  }

      return (
    <div className="justify-center items-center bg-neutral-200 min-h-[100vh] flex flex-col px-16 py-11 max-md:px-5">
      <span className="shadow-lg bg-blue-950 flex w-[650px] max-w-full flex-col mb-5 pl-12 pr-8 pb-2.5 rounded-2xl max-md:px-5 text-white">
        <img
          srcSet={process.env.PUBLIC_URL + "/assets/images/logo.png"}
          alt="Eagle Engagement Logo"
          className="h-40 w-auto"
        />
        <div className="justify-center items-center self-stretch flex flex-col mt-11 px-16 max-md:max-w-full max-md:mt-10 max-md:px-5">
          <div className="flex max-w-full flex-col items-center">
            <FontAwesomeIcon icon={faCheck} size="4x" />
            <span className="text-center text-5xl font-bold whitespace-nowrap items-stretch self-stretch mt-5 pb-7 px-3 max-md:text-4xl">
              Verify
            </span>
              <span className="text-xl max-md:mb-4 max-md:text-l">
		  Validate your account
            </span>
          </div>
        </div>
          <div>
	  </div>
	  
    
}
