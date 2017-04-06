import React from 'react-native';

const RNKochava = React.NativeModules.RNKochava;

export default {
  init: (options) => {
    return RNKochava.init(options);
  },
  identityLink: (identity) => {
    return RNKochava.identityLink(identity);
  },
  sendEvent: (name, options) => {
    return RNKochava.sendEvent(name, options);
  },
};
