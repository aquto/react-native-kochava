import React from 'react-native';

const RNKochava = React.NativeModules.RNKochava;

export default {
  init: () => {
    return RNKochava.init();
  },
  identityLink: (identity) => {
    return RNKochava.identityLink(identity);
  },
  sendEvent: (name, options) => {
    return RNKochava.sendEvent(name, options);
  },
};
