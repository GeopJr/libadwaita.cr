require "../g_object-2.0/object"

module Gio
  # #GResolver provides cancellable synchronous and asynchronous DNS
  # resolution, for hostnames (g_resolver_lookup_by_address(),
  # g_resolver_lookup_by_name() and their async variants) and SRV
  # (service) records (g_resolver_lookup_service()).
  #
  # #GNetworkAddress and #GNetworkService provide wrappers around
  # #GResolver functionality that also implement #GSocketConnectable,
  # making it easy to connect to a remote host/service.
  class Resolver < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resolver_get_type
    end

    def self.default : Gio::Resolver
      # g_resolver_get_default: (None)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_get_default
      Gio::Resolver.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_by_address(address : Gio::InetAddress, cancellable : Gio::Cancellable?) : ::String
      # g_resolver_lookup_by_address: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_resolver_lookup_by_address(self, address, cancellable)
      GICrystal.transfer_full(_retval)
    end

    def lookup_by_address_async(address : Gio::InetAddress, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_resolver_lookup_by_address_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_resolver_lookup_by_address_async(self, address, cancellable, callback, user_data)
    end

    def lookup_by_address_finish(result : Gio::AsyncResult) : ::String
      # g_resolver_lookup_by_address_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_lookup_by_address_finish(self, result)
      GICrystal.transfer_full(_retval)
    end

    def lookup_by_name(hostname : ::String, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_by_name: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_resolver_lookup_by_name(self, hostname, cancellable)
      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_by_name_async(hostname : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_resolver_lookup_by_name_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_resolver_lookup_by_name_async(self, hostname, cancellable, callback, user_data)
    end

    def lookup_by_name_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_by_name_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_lookup_by_name_finish(self, result)
      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_by_name_with_flags(hostname : ::String, flags : Gio::ResolverNameLookupFlags, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_by_name_with_flags: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_resolver_lookup_by_name_with_flags(self, hostname, flags, cancellable)
      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_by_name_with_flags_async(hostname : ::String, flags : Gio::ResolverNameLookupFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_resolver_lookup_by_name_with_flags_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_resolver_lookup_by_name_with_flags_async(self, hostname, flags, cancellable, callback, user_data)
    end

    def lookup_by_name_with_flags_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_by_name_with_flags_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_lookup_by_name_with_flags_finish(self, result)
      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_records(rrname : ::String, record_type : Gio::ResolverRecordType, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_records: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_resolver_lookup_records(self, rrname, record_type, cancellable)
      GLib::List(GLib::Variant).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_records_async(rrname : ::String, record_type : Gio::ResolverRecordType, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_resolver_lookup_records_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_resolver_lookup_records_async(self, rrname, record_type, cancellable, callback, user_data)
    end

    def lookup_records_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_records_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_lookup_records_finish(self, result)
      GLib::List(GLib::Variant).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_service(service : ::String, protocol : ::String, domain : ::String, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_service: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      _retval = LibGio.g_resolver_lookup_service(self, service, protocol, domain, cancellable)
      GLib::List(Gio::SrvTarget).new(_retval, GICrystal::Transfer::Full)
    end

    def lookup_service_async(service : ::String, protocol : ::String, domain : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Nil)?) : Nil
      # g_resolver_lookup_service_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      LibGio.g_resolver_lookup_service_async(self, service, protocol, domain, cancellable, callback, user_data)
    end

    def lookup_service_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_service_finish: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_resolver_lookup_service_finish(self, result)
      GLib::List(Gio::SrvTarget).new(_retval, GICrystal::Transfer::Full)
    end

    def set_default : Nil
      # g_resolver_set_default: (Method)
      # Returns: (transfer none)

      LibGio.g_resolver_set_default(self)
    end

    struct ReloadSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "reload::#{@detail}" : "reload"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::Resolver, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Resolver.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Resolver, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::Resolver, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::Resolver.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Resolver, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "reload")
      end
    end

    def reload_signal
      ReloadSignal.new(self)
    end
  end
end
