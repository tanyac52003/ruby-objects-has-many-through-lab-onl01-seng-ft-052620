class Doctor
  attr_accessor :name, :date, :patient 
  @@all = []
  
  def initialize(name)
    @name = name 
    @appointments = []
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_appointment(date,patient)
    Appointment.new(date,patient,self)
  end 
 
    def appointments
    appts = Appointment.class_variable_get(:@@all)
    appts.each do |appointment|
      if appointment.doctor == self 
        @appointments.push(appointment)
      end 
    end 
  end
 
  
  def patients
    appointments.map {|appointment| appointment.patient}
  end 
end 