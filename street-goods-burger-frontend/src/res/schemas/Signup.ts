import { object, string, ref } from "yup";

const SigninSchema = object({
  firstname: string()
    .required("please provide a firstname"),
  lastname: string()
    .required("please provide a lastname"),
  email: string()
    .email()
    .required("please provide an email"),
  password: string()
    .min(6, "password must be 6 characters long")
    .required("please provide a password"),
  passwordConfirmation: string()
    .oneOf([ref("password"), null], "passwords must match")
    .required("please provide a password"),
});

export default SigninSchema;
