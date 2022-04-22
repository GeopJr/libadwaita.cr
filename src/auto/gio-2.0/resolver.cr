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
  @[GObject::GeneratedWrapper]
  class Resolver < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ResolverClass), class_init,
        sizeof(LibGio::Resolver), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_resolver_get_type
    end

    # Gets the default #GResolver. You should unref it when you are done
    # with it. #GResolver may use its reference count as a hint about how
    # many threads it should allocate for concurrent DNS resolutions.
    def self.default : Gio::Resolver
      # g_resolver_get_default: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_resolver_get_default

      # Return value handling

      Gio::Resolver.new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously reverse-resolves @address to determine its
    # associated hostname.
    #
    # If the DNS resolution fails, @error (if non-%NULL) will be set to
    # a value from #GResolverError.
    #
    # If @cancellable is non-%NULL, it can be used to cancel the
    # operation, in which case @error (if non-%NULL) will be set to
    # %G_IO_ERROR_CANCELLED.
    def lookup_by_address(address : Gio::InetAddress, cancellable : Gio::Cancellable?) : ::String
      # g_resolver_lookup_by_address: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_resolver_lookup_by_address(self, address, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Begins asynchronously reverse-resolving @address to determine its
    # associated hostname, and eventually calls @callback, which must
    # call g_resolver_lookup_by_address_finish() to get the final result.
    def lookup_by_address_async(address : Gio::InetAddress, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_resolver_lookup_by_address_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_resolver_lookup_by_address_async(self, address, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a previous call to
    # g_resolver_lookup_by_address_async().
    #
    # If the DNS resolution failed, @error (if non-%NULL) will be set to
    # a value from #GResolverError. If the operation was cancelled,
    # @error will be set to %G_IO_ERROR_CANCELLED.
    def lookup_by_address_finish(result : Gio::AsyncResult) : ::String
      # g_resolver_lookup_by_address_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_resolver_lookup_by_address_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Synchronously resolves @hostname to determine its associated IP
    # address(es). @hostname may be an ASCII-only or UTF-8 hostname, or
    # the textual form of an IP address (in which case this just becomes
    # a wrapper around g_inet_address_new_from_string()).
    #
    # On success, g_resolver_lookup_by_name() will return a non-empty #GList of
    # #GInetAddress, sorted in order of preference and guaranteed to not
    # contain duplicates. That is, if using the result to connect to
    # @hostname, you should attempt to connect to the first address
    # first, then the second if the first fails, etc. If you are using
    # the result to listen on a socket, it is appropriate to add each
    # result using e.g. g_socket_listener_add_address().
    #
    # If the DNS resolution fails, @error (if non-%NULL) will be set to a
    # value from #GResolverError and %NULL will be returned.
    #
    # If @cancellable is non-%NULL, it can be used to cancel the
    # operation, in which case @error (if non-%NULL) will be set to
    # %G_IO_ERROR_CANCELLED.
    #
    # If you are planning to connect to a socket on the resolved IP
    # address, it may be easier to create a #GNetworkAddress and use its
    # #GSocketConnectable interface.
    def lookup_by_name(hostname : ::String, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_by_name: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_resolver_lookup_by_name(self, hostname, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    # Begins asynchronously resolving @hostname to determine its
    # associated IP address(es), and eventually calls @callback, which
    # must call g_resolver_lookup_by_name_finish() to get the result.
    # See g_resolver_lookup_by_name() for more details.
    def lookup_by_name_async(hostname : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_resolver_lookup_by_name_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_resolver_lookup_by_name_async(self, hostname, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a call to
    # g_resolver_lookup_by_name_async().
    #
    # If the DNS resolution failed, @error (if non-%NULL) will be set to
    # a value from #GResolverError. If the operation was cancelled,
    # @error will be set to %G_IO_ERROR_CANCELLED.
    def lookup_by_name_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_by_name_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_resolver_lookup_by_name_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    # This differs from g_resolver_lookup_by_name() in that you can modify
    # the lookup behavior with @flags. For example this can be used to limit
    # results with %G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY.
    def lookup_by_name_with_flags(hostname : ::String, flags : Gio::ResolverNameLookupFlags, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_by_name_with_flags: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_resolver_lookup_by_name_with_flags(self, hostname, flags, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    # Begins asynchronously resolving @hostname to determine its
    # associated IP address(es), and eventually calls @callback, which
    # must call g_resolver_lookup_by_name_with_flags_finish() to get the result.
    # See g_resolver_lookup_by_name() for more details.
    def lookup_by_name_with_flags_async(hostname : ::String, flags : Gio::ResolverNameLookupFlags, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_resolver_lookup_by_name_with_flags_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_resolver_lookup_by_name_with_flags_async(self, hostname, flags, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a call to
    # g_resolver_lookup_by_name_with_flags_async().
    #
    # If the DNS resolution failed, @error (if non-%NULL) will be set to
    # a value from #GResolverError. If the operation was cancelled,
    # @error will be set to %G_IO_ERROR_CANCELLED.
    def lookup_by_name_with_flags_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_by_name_with_flags_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_resolver_lookup_by_name_with_flags_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::InetAddress).new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously performs a DNS record lookup for the given @rrname and returns
    # a list of records as #GVariant tuples. See #GResolverRecordType for
    # information on what the records contain for each @record_type.
    #
    # If the DNS resolution fails, @error (if non-%NULL) will be set to
    # a value from #GResolverError and %NULL will be returned.
    #
    # If @cancellable is non-%NULL, it can be used to cancel the
    # operation, in which case @error (if non-%NULL) will be set to
    # %G_IO_ERROR_CANCELLED.
    def lookup_records(rrname : ::String, record_type : Gio::ResolverRecordType, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_records: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_resolver_lookup_records(self, rrname, record_type, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(GLib::Variant).new(_retval, GICrystal::Transfer::Full)
    end

    # Begins asynchronously performing a DNS lookup for the given
    # @rrname, and eventually calls @callback, which must call
    # g_resolver_lookup_records_finish() to get the final result. See
    # g_resolver_lookup_records() for more details.
    def lookup_records_async(rrname : ::String, record_type : Gio::ResolverRecordType, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_resolver_lookup_records_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_resolver_lookup_records_async(self, rrname, record_type, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a previous call to
    # g_resolver_lookup_records_async(). Returns a non-empty list of records as
    # #GVariant tuples. See #GResolverRecordType for information on what the
    # records contain.
    #
    # If the DNS resolution failed, @error (if non-%NULL) will be set to
    # a value from #GResolverError. If the operation was cancelled,
    # @error will be set to %G_IO_ERROR_CANCELLED.
    def lookup_records_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_records_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_resolver_lookup_records_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(GLib::Variant).new(_retval, GICrystal::Transfer::Full)
    end

    # Synchronously performs a DNS SRV lookup for the given @service and
    # @protocol in the given @domain and returns an array of #GSrvTarget.
    # @domain may be an ASCII-only or UTF-8 hostname. Note also that the
    # @service and @protocol arguments do not include the leading underscore
    # that appears in the actual DNS entry.
    #
    # On success, g_resolver_lookup_service() will return a non-empty #GList of
    # #GSrvTarget, sorted in order of preference. (That is, you should
    # attempt to connect to the first target first, then the second if
    # the first fails, etc.)
    #
    # If the DNS resolution fails, @error (if non-%NULL) will be set to
    # a value from #GResolverError and %NULL will be returned.
    #
    # If @cancellable is non-%NULL, it can be used to cancel the
    # operation, in which case @error (if non-%NULL) will be set to
    # %G_IO_ERROR_CANCELLED.
    #
    # If you are planning to connect to the service, it is usually easier
    # to create a #GNetworkService and use its #GSocketConnectable
    # interface.
    def lookup_service(service : ::String, protocol : ::String, domain : ::String, cancellable : Gio::Cancellable?) : GLib::List
      # g_resolver_lookup_service: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_resolver_lookup_service(self, service, protocol, domain, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::SrvTarget).new(_retval, GICrystal::Transfer::Full)
    end

    # Begins asynchronously performing a DNS SRV lookup for the given
    # @service and @protocol in the given @domain, and eventually calls
    # @callback, which must call g_resolver_lookup_service_finish() to
    # get the final result. See g_resolver_lookup_service() for more
    # details.
    def lookup_service_async(service : ::String, protocol : ::String, domain : ::String, cancellable : Gio::Cancellable?, callback : Pointer(Void)?, user_data : Pointer(Void)?) : Nil
      # g_resolver_lookup_service_async: (Method)
      # @cancellable: (nullable)
      # @callback: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # Generator::NullableArrayPlan
      callback = if callback.nil?
                   LibGio::AsyncReadyCallback.null
                 else
                   callback.to_unsafe
                 end

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_resolver_lookup_service_async(self, service, protocol, domain, cancellable, callback, user_data)

      # Return value handling
    end

    # Retrieves the result of a previous call to
    # g_resolver_lookup_service_async().
    #
    # If the DNS resolution failed, @error (if non-%NULL) will be set to
    # a value from #GResolverError. If the operation was cancelled,
    # @error will be set to %G_IO_ERROR_CANCELLED.
    def lookup_service_finish(result : Gio::AsyncResult) : GLib::List
      # g_resolver_lookup_service_finish: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_resolver_lookup_service_finish(self, result, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GLib::List(Gio::SrvTarget).new(_retval, GICrystal::Transfer::Full)
    end

    # Sets @resolver to be the application's default resolver (reffing
    # @resolver, and unreffing the previous default resolver, if any).
    # Future calls to g_resolver_get_default() will return this resolver.
    #
    # This can be used if an application wants to perform any sort of DNS
    # caching or "pinning"; it can implement its own #GResolver that
    # calls the original default resolver for DNS operations, and
    # implements its own cache policies on top of that, and then set
    # itself as the default resolver for all later code to use.
    def set_default : Nil
      # g_resolver_set_default: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_resolver_set_default(self)

      # Return value handling
    end

    # Emitted when the resolver notices that the system resolver
    # configuration has changed.
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
