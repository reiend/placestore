import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { chakra, Box } from '@chakra-ui/react';

const MerchantDashboard = () => {
  const navigate = useNavigate();

  useEffect(() => {
    const authorization = localStorage.getItem('authorization');
    const role = localStorage.getItem('role');

    // protect route needs to be merchant and signin
    if (!(authorization && role === 'store_admin'))
      navigate('/merchant/signin', { replace: true });
  });

  return (
    <chakra.div>
      <Box></Box>
      <Box></Box>
    </chakra.div>
  );
};

export default MerchantDashboard;
