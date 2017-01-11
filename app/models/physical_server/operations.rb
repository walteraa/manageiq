module PhysicalServer::Operations
  extend ActiveSupport::Concern

<<<<<<< 96bd625b773a324e62712f0adfce0bff7ec7d662
  include_concern 'Power'
#include_concern 'Led'
=======
  #include_concern 'Power'
  include_concern 'Led'
>>>>>>> Add support for turning on/off LEDs - working ver

end