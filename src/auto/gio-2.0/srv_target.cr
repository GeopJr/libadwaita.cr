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
      raise ArgumentError.new if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(SrvTarget.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(SrvTarget.g_type, self)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_srv_target_get_type
    end

    def initialize(hostname : ::String, port : UInt16, priority : UInt16, weight : UInt16)
      # g_srv_target_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_new(hostname, port, priority, weight)

      # Return value handling
      @pointer = _retval
    end

    def copy : Gio::SrvTarget
      # g_srv_target_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_copy(self)

      # Return value handling
      Gio::SrvTarget.new(_retval, GICrystal::Transfer::Full)
    end

    def free : Nil
      # g_srv_target_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_srv_target_free(self)

      # Return value handling
    end

    def hostname : ::String
      # g_srv_target_get_hostname: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_get_hostname(self)

      # Return value handling
      ::String.new(_retval)
    end

    def port : UInt16
      # g_srv_target_get_port: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_get_port(self)

      # Return value handling
      _retval
    end

    def priority : UInt16
      # g_srv_target_get_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_get_priority(self)

      # Return value handling
      _retval
    end

    def weight : UInt16
      # g_srv_target_get_weight: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_srv_target_get_weight(self)

      # Return value handling
      _retval
    end

    def to_unsafe
      @pointer
    end
  end
end
