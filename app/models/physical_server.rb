class PhysicalServer < ApplicationRecord
  include NewWithTypeStiMixin
  include_concern 'Operations'

  acts_as_miq_taggable

  def name_with_details
    details % {
      :name => name,
    }
  end

<<<<<<< cb16003f9a96c451a0a1cc8ace987872a1fd4c9d
  def my_zone 
    ems = ext_management_system 
    ems ? ems.my_zone : MiqServer.my_zone 
  end

=======
  def my_zone
    ems = ext_management_system
    ems ? ems.my_zone : MiqServer.my_zone
  end

  def turn_on_loc_led
    unless ext_management_system
      raise _(" A Server #{self} <%{name}> with Id:
       <%{id}> is not associated with a provider.") % {:name => name, :id => id}
    end
    verb = :turn_on_loc_led
    options = {}
    $lenovo_log.info("Send turn on LED #{self} #{verb} #{options} #{serialNumber}")
    $lenovo_log.info("Management System Name: #{ext_management_system.name}")
    ext_management_system.send(verb, self, options)
    $lenovo_log.info("Complete turn on LED #{self} #{verb} #{options}")
  end

  def turn_off_loc_led
    $lenovo_log.info("Turn off LED")
  end
>>>>>>> Updates for rubocop results
end
