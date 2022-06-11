module Gio
  # SRV (service) records are used by some network protocols to provide
  # service-specific aliasing and load-balancing. For example, XMPP
  # (Jabber) uses SRV records to locate the XMPP server for a domain;
  # rather than connecting directly to "example.com" or assuming a
  # specific server hostname like "xmpp.example.com", an XMPP client
  # would look up the "xmpp-client" SRV record for "example.com", and
  # then connect to whatever host was pointed to by that record.
  #
  # You can use g_resolver_lookup_service() or
  # g_resolver_lookup_service_async() to find the #GSrvTargets
  # for a given service. However, if you are simply planning to connect
  # to the remote service, you can use #GNetworkService's
  # #GSocketConnectable interface and not need to worry about
  # #GSrvTarget at all.
  class SrvTarget
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SrvTarget.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SrvTarget.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::SrvTarget)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_srv_target_get_type
    end

    def self.new(hostname : ::String, port : UInt16, priority : UInt16, weight : UInt16) : self
      # g_srv_target_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_srv_target_new(hostname, port, priority, weight)

      # Return value handling

      Gio::SrvTarget.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gio::SrvTarget
      # g_srv_target_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_srv_target_copy(@pointer)

      # Return value handling

      Gio::SrvTarget.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_srv_target_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_srv_target_free(@pointer)

      # Return value handling
    end

    def hostname : ::String
      # g_srv_target_get_hostname: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_srv_target_get_hostname(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    def port : UInt16
      # g_srv_target_get_port: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_srv_target_get_port(@pointer)

      # Return value handling

      _retval
    end

    def priority : UInt16
      # g_srv_target_get_priority: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_srv_target_get_priority(@pointer)

      # Return value handling

      _retval
    end

    def weight : UInt16
      # g_srv_target_get_weight: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_srv_target_get_weight(@pointer)

      # Return value handling

      _retval
    end

    def to_unsafe
      @pointer
    end
  end
end
