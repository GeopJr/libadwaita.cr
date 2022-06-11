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

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(DBusAuthObserver, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `DBusAuthObserver`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_auth_observer_get_type
    end

    # Emits the #GDBusAuthObserver::allow-mechanism signal on @observer.
    def allow_mechanism(mechanism : ::String) : Bool
      # g_dbus_auth_observer_allow_mechanism: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_auth_observer_allow_mechanism(@pointer, mechanism)

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
      _retval = LibGio.g_dbus_auth_observer_authorize_authenticated_peer(@pointer, stream, credentials)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Emitted to check if @mechanism is allowed to be used.
    struct AllowMechanismSignal < GObject::Signal
      def name : String
        @detail ? "allow-mechanism::#{@detail}" : "allow-mechanism"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mechanism : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          mechanism = ::String.new(lib_mechanism)
          ::Box(Proc(::String, Bool)).unbox(_lib_box).call(mechanism)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusAuthObserver, ::String, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mechanism : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusAuthObserver.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          mechanism = ::String.new(lib_mechanism)
          ::Box(Proc(Gio::DBusAuthObserver, ::String, Bool)).unbox(_lib_box).call(_sender, mechanism)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
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
    struct AuthorizeAuthenticatedPeerSignal < GObject::Signal
      def name : String
        @detail ? "authorize-authenticated-peer::#{@detail}" : "authorize-authenticated-peer"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::IOStream, Gio::Credentials?, Bool)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::IOStream, Gio::Credentials?, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_stream : Pointer(Void), lib_credentials : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          stream = Gio::IOStream.new(lib_stream, :none)
          # Generator::NullableArrayPlan
          credentials = (lib_credentials.null? ? nil : Gio::Credentials.new(lib_credentials, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          credentials = Gio::Credentials.new(lib_credentials, :none) unless lib_credentials.null?
          ::Box(Proc(Gio::IOStream, Gio::Credentials?, Bool)).unbox(_lib_box).call(stream, credentials)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_stream : Pointer(Void), lib_credentials : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::DBusAuthObserver.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          stream = Gio::IOStream.new(lib_stream, :none)
          # Generator::NullableArrayPlan
          credentials = (lib_credentials.null? ? nil : Gio::Credentials.new(lib_credentials, GICrystal::Transfer::None))
          # Generator::BuiltInTypeArgPlan
          credentials = Gio::Credentials.new(lib_credentials, :none) unless lib_credentials.null?
          ::Box(Proc(Gio::DBusAuthObserver, Gio::IOStream, Gio::Credentials?, Bool)).unbox(_lib_box).call(_sender, stream, credentials)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(stream : Gio::IOStream, credentials : Gio::Credentials?) : Nil
        # Generator::NullableArrayPlan
        credentials = if credentials.nil?
                        Void.null
                      else
                        credentials.to_unsafe
                      end

        LibGObject.g_signal_emit_by_name(@source, "authorize-authenticated-peer", stream, credentials)
      end
    end

    def authorize_authenticated_peer_signal
      AuthorizeAuthenticatedPeerSignal.new(self)
    end
  end
end
