import {
  Drawer,
  DrawerBody,
  DrawerOverlay,
  DrawerContent,
  DrawerCloseButton
} from '@chakra-ui/react';

interface AppAuthDrawer {
  onClose: () => void;
  isOpen: boolean;
  authForm: JSX.Element | string;
}

const AppAuthDrawer = ({ onClose, isOpen, authForm }: AppAuthDrawer) => {
  return (
    <Drawer onClose={onClose} isOpen={isOpen} size={'md'}>
      <DrawerOverlay />
      <DrawerContent>
        <DrawerCloseButton />
        <DrawerBody>{authForm}</DrawerBody>
      </DrawerContent>
    </Drawer>
  );
};

export default AppAuthDrawer;
