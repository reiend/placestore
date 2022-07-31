const blobToBase64 = url => {
  return new Promise(async resolve => {
    // do a request to the blob uri
    const response = await fetch(url);

    // response has a method called .blob() to get the blob file
    const blob = await response.blob();

    const fileReader = new FileReader();
    fileReader.readAsDataURL(blob);

    fileReader.onloadend = function () {
      resolve(fileReader.result); // Here is the base64 string
    };
  });
};

export default blobToBase64;
