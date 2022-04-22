require "../g_object-2.0/object"

module Gio
  # The #GDBusAuthObserver type provides a mechanism for participating
  # in how a #GDBusServer (or a #GDBusConnection) authenticates remote
  # peers. Simply instantiate a #GDBusAuthObserver and connect to the
  # signals you are interested in. Note that new signals may be added
  # in the future
  #
  # ## Controlling Authentication Mechanisms
  #
  # By default, a #GDBusServer or server-side #GDBusConnection will allow
  # any authentication mechanism to be used. If you only
  # want to allow D-Bus connections with the `EXTERNAL` mechanism,
  # which makes use of credentials passing and is the recommended
  # mechanism for modern Unix platforms such as Linux and the BSD family,
  # you would use a signal handler like this:
  #
  # |[<!-- language="C" -->
  # static gboolean
  # on_allow_mechanism (GDBusAuthObserver *observer,
  #                     const gchar       *mechanism,
  #                     gpointer           user_data)
  # {
  #   if (g_strcmp0 (mechanism, "EXTERNAL") == 0)
  #     {
  #       return TRUE;
  #     }
  #
  #   return FALSE;
  # }
  # ]|
  #
  # ## Controlling Authorization # {#auth-observer}
  #
  # By default, a #GDBusServer or server-side #GDBusConnection will accept
  # connections from any successfully authenticated user (but not from
  # anonymous connections using the `ANONYMOUS` mechanism). If you only
  # want to allow D-Bus connections from processes owned by the same uid
  # as the server, since GLib 2.68, you should use the
  # %G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flag. It’s equivalent
  # to the following signal handler:
  #
  # |[<!-- language="C" -->
  # static gboolean
  # on_authorize_authenticated_peer (GDBusAuthObserver *observer,
  #                                  GIOStream         *stream,
  #                                  GCredentials      *credentials,
  #                                  gpointer           user_data)
  # {
  #   gboolean authorized;
  #
  #   authorized = FALSE;
  #   if (credentials != NULL)
  #     {
  #       GCredentials *own_credentials;
  #       own_credentials = g_credentials_new ();
  #       if (g_credentials_is_same_user (credentials, own_credentials, NULL))
  #         authorized = TRUE;
  #       g_object_unref (own_credentials);
  #     }
  #
  #   return authorized;
  # }
  # ]|
  @[GObject::GeneratedWrapper]
  class DBusAuthObserver < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::DBusAuthObserver), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_auth_observer_get_type
    end

    # Creates a new #GDBusAuthObserver object.
    def initialize
      # g_dbus_auth_observer_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_auth_observer_new

      # Return value handling

      @pointer = _retval
    end

    # Emits the #GDBusAuthObserver::allow-mechanism signal on @observer.
    def allow_mechanism(mechanism : ::String) : Bool
      # g_dbus_auth_observer_allow_mechanism: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_auth_observer_allow_mechanism(self, mechanism)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emits the #GDBusAuthObserver::authorize-authenticated-peer signal on @observer.
    def authorize_authenticated_peer(stream : Gio::IOStream, credentials : Gio::Credentials?) : Bool
      # g_dbus_auth_observer_authorize_authenticated_peer: (Method)
      # @credentials: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      credentials = if credentials.nil?
                      Pointer(Void).null
                    else
                      credentials.to_unsafe
                    end

      # C call
      _retval = LibGio.g_dbus_auth_observer_authorize_authenticated_peer(self, stream, credentials)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted to check if @mechanism is allowed to be used.
    struct AllowMechanismSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "allow-mechanism::#{@detail}" : "allow-mechanism"
      end

      def connect(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          _retval = ::Box(Proc(::String, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          _retval = ::Box(Proc(::String, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusAuthObserver, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::DBusAuthObserver.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::DBusAuthObserver, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusAuthObserver, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gio::DBusAuthObserver.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gio::DBusAuthObserver, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mechanism : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "allow-mechanism", mechanism)
      end
    end

    def allow_mechanism_signal
      AllowMechanismSignal.new(self)
    end

    # Emitted to check if a peer that is successfully authenticated
    # is authorized.
    struct AuthorizeAuthenticatedPeerSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "authorize-authenticated-peer::#{@detail}" : "authorize-authenticated-peer"
      end

      def connect(&block : Proc(Gio::IOStream, Gio::Credentials?, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gio::IOStream, Gio::Credentials?, Bool))
        connect(block)
      end

      def connect(block : Proc(Gio::IOStream, Gio::Credentials?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::IOStream.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::Credentials.new(lib_arg1, GICrystal::Transfer::None))
          _retval = ::Box(Proc(Gio::IOStream, Gio::Credentials?, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::IOStream, Gio::Credentials?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gio::IOStream.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::Credentials.new(lib_arg1, GICrystal::Transfer::None))
          _retval = ::Box(Proc(Gio::IOStream, Gio::Credentials?, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusAuthObserver.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::IOStream.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::Credentials.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gio::DBusAuthObserver.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gio::IOStream.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = (lib_arg1.null? ? nil : Gio::Credentials.new(lib_arg1, GICrystal::Transfer::None))
          ::Box(Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(stream : Gio::IOStream, credentials : Gio::Credentials?) : Nil
        LibGObject.g_signal_emit_by_name(@source, "authorize-authenticated-peer", stream, credentials)
      end
    end

    def authorize_authenticated_peer_signal
      AuthorizeAuthenticatedPeerSignal.new(self)
    end
  end
end
