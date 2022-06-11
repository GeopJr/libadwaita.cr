require "../g_object-2.0/object"

module Gio
  # #GMountOperation provides a mechanism for interacting with the user.
  # It can be used for authenticating mountable operations, such as loop
  # mounting files, hard drive partitions or server locations. It can
  # also be used to ask the user questions or show a list of applications
  # preventing unmount or eject operations from completing.
  #
  # Note that #GMountOperation is used for more than just #GMount
  # objects – for example it is also used in g_drive_start() and
  # g_drive_stop().
  #
  # Users should instantiate a subclass of this that implements all the
  # various callbacks to show the required dialogs, such as
  # #GtkMountOperation. If no user interaction is desired (for example
  # when automounting filesystems at login time), usually %NULL can be
  # passed, see each method taking a #GMountOperation for details.
  #
  # The term ‘TCRYPT’ is used to mean ‘compatible with TrueCrypt and VeraCrypt’.
  # [TrueCrypt](https://en.wikipedia.org/wiki/TrueCrypt) is a discontinued system for
  # encrypting file containers, partitions or whole disks, typically used with Windows.
  # [VeraCrypt](https://www.veracrypt.fr/) is a maintained fork of TrueCrypt with various
  # improvements and auditing fixes.
  @[GObject::GeneratedWrapper]
  class MountOperation < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::MountOperationClass), class_init,
        sizeof(LibGio::MountOperation), instance_init, 0)
    end

    GICrystal.define_new_method(MountOperation, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `MountOperation`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, anonymous : Bool? = nil, choice : Int32? = nil, domain : ::String? = nil, is_tcrypt_hidden_volume : Bool? = nil, is_tcrypt_system_volume : Bool? = nil, password : ::String? = nil, password_save : Gio::PasswordSave? = nil, pim : UInt32? = nil, username : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !anonymous.nil?
        (_names.to_unsafe + _n).value = "anonymous".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, anonymous)
        _n += 1
      end
      if !choice.nil?
        (_names.to_unsafe + _n).value = "choice".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, choice)
        _n += 1
      end
      if !domain.nil?
        (_names.to_unsafe + _n).value = "domain".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, domain)
        _n += 1
      end
      if !is_tcrypt_hidden_volume.nil?
        (_names.to_unsafe + _n).value = "is-tcrypt-hidden-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_hidden_volume)
        _n += 1
      end
      if !is_tcrypt_system_volume.nil?
        (_names.to_unsafe + _n).value = "is-tcrypt-system-volume".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_tcrypt_system_volume)
        _n += 1
      end
      if !password.nil?
        (_names.to_unsafe + _n).value = "password".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password)
        _n += 1
      end
      if !password_save.nil?
        (_names.to_unsafe + _n).value = "password-save".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, password_save)
        _n += 1
      end
      if !pim.nil?
        (_names.to_unsafe + _n).value = "pim".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, pim)
        _n += 1
      end
      if !username.nil?
        (_names.to_unsafe + _n).value = "username".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, username)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(MountOperation.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_mount_operation_get_type
    end

    def anonymous=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "anonymous", unsafe_value, Pointer(Void).null)
      value
    end

    def anonymous? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "anonymous", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def choice=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "choice", unsafe_value, Pointer(Void).null)
      value
    end

    def choice : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "choice", pointerof(value), Pointer(Void).null)
      value
    end

    def domain=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "domain", unsafe_value, Pointer(Void).null)
      value
    end

    def domain : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "domain", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def is_tcrypt_hidden_volume=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-tcrypt-hidden-volume", unsafe_value, Pointer(Void).null)
      value
    end

    def is_tcrypt_hidden_volume? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-tcrypt-hidden-volume", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def is_tcrypt_system_volume=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "is-tcrypt-system-volume", unsafe_value, Pointer(Void).null)
      value
    end

    def is_tcrypt_system_volume? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "is-tcrypt-system-volume", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def password=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "password", unsafe_value, Pointer(Void).null)
      value
    end

    def password : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "password", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def password_save=(value : Gio::PasswordSave) : Gio::PasswordSave
      unsafe_value = value

      LibGObject.g_object_set(self, "password-save", unsafe_value, Pointer(Void).null)
      value
    end

    def password_save : Gio::PasswordSave
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "password-save", pointerof(value), Pointer(Void).null)
      Gio::PasswordSave.new(value)
    end

    def pim=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "pim", unsafe_value, Pointer(Void).null)
      value
    end

    def pim : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "pim", pointerof(value), Pointer(Void).null)
      value
    end

    def username=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "username", unsafe_value, Pointer(Void).null)
      value
    end

    def username : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "username", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Check to see whether the mount operation is being used
    # for an anonymous user.
    def anonymous : Bool
      # g_mount_operation_get_anonymous: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_anonymous(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets a choice from the mount operation.
    def choice : Int32
      # g_mount_operation_get_choice: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_choice(@pointer)

      # Return value handling

      _retval
    end

    # Gets the domain of the mount operation.
    def domain : ::String?
      # g_mount_operation_get_domain: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_domain(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Check to see whether the mount operation is being used
    # for a TCRYPT hidden volume.
    def is_tcrypt_hidden_volume : Bool
      # g_mount_operation_get_is_tcrypt_hidden_volume: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_is_tcrypt_hidden_volume(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Check to see whether the mount operation is being used
    # for a TCRYPT system volume.
    def is_tcrypt_system_volume : Bool
      # g_mount_operation_get_is_tcrypt_system_volume: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_is_tcrypt_system_volume(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets a password from the mount operation.
    def password : ::String?
      # g_mount_operation_get_password: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_password(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the state of saving passwords for the mount operation.
    def password_save : Gio::PasswordSave
      # g_mount_operation_get_password_save: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_password_save(@pointer)

      # Return value handling

      Gio::PasswordSave.new(_retval)
    end

    # Gets a PIM from the mount operation.
    def pim : UInt32
      # g_mount_operation_get_pim: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_pim(@pointer)

      # Return value handling

      _retval
    end

    # Get the user name from the mount operation.
    def username : ::String?
      # g_mount_operation_get_username: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_mount_operation_get_username(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Emits the #GMountOperation::reply signal.
    def reply(result : Gio::MountOperationResult) : Nil
      # g_mount_operation_reply: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_reply(@pointer, result)

      # Return value handling
    end

    # Sets the mount operation to use an anonymous user if @anonymous is %TRUE.
    def anonymous=(anonymous : Bool) : Nil
      # g_mount_operation_set_anonymous: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_anonymous(@pointer, anonymous)

      # Return value handling
    end

    # Sets a default choice for the mount operation.
    def choice=(choice : Int32) : Nil
      # g_mount_operation_set_choice: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_choice(@pointer, choice)

      # Return value handling
    end

    # Sets the mount operation's domain.
    def domain=(domain : ::String?) : Nil
      # g_mount_operation_set_domain: (Method | Setter)
      # @domain: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      domain = if domain.nil?
                 Pointer(LibC::Char).null
               else
                 domain.to_unsafe
               end

      # C call
      LibGio.g_mount_operation_set_domain(@pointer, domain)

      # Return value handling
    end

    # Sets the mount operation to use a hidden volume if @hidden_volume is %TRUE.
    def is_tcrypt_hidden_volume=(hidden_volume : Bool) : Nil
      # g_mount_operation_set_is_tcrypt_hidden_volume: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_is_tcrypt_hidden_volume(@pointer, hidden_volume)

      # Return value handling
    end

    # Sets the mount operation to use a system volume if @system_volume is %TRUE.
    def is_tcrypt_system_volume=(system_volume : Bool) : Nil
      # g_mount_operation_set_is_tcrypt_system_volume: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_is_tcrypt_system_volume(@pointer, system_volume)

      # Return value handling
    end

    # Sets the mount operation's password to @password.
    def password=(password : ::String?) : Nil
      # g_mount_operation_set_password: (Method | Setter)
      # @password: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      password = if password.nil?
                   Pointer(LibC::Char).null
                 else
                   password.to_unsafe
                 end

      # C call
      LibGio.g_mount_operation_set_password(@pointer, password)

      # Return value handling
    end

    # Sets the state of saving passwords for the mount operation.
    def password_save=(save : Gio::PasswordSave) : Nil
      # g_mount_operation_set_password_save: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_password_save(@pointer, save)

      # Return value handling
    end

    # Sets the mount operation's PIM to @pim.
    def pim=(pim : UInt32) : Nil
      # g_mount_operation_set_pim: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGio.g_mount_operation_set_pim(@pointer, pim)

      # Return value handling
    end

    # Sets the user name within @op to @username.
    def username=(username : ::String?) : Nil
      # g_mount_operation_set_username: (Method | Setter)
      # @username: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      username = if username.nil?
                   Pointer(LibC::Char).null
                 else
                   username.to_unsafe
                 end

      # C call
      LibGio.g_mount_operation_set_username(@pointer, username)

      # Return value handling
    end

    # Emitted by the backend when e.g. a device becomes unavailable
    # while a mount operation is in progress.
    #
    # Implementations of GMountOperation should handle this signal
    # by dismissing open password dialogs.
    struct AbortedSignal < GObject::Signal
      def name : String
        @detail ? "aborted::#{@detail}" : "aborted"
      end

      def connect(*, after : Bool = false, &block : Proc(Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::MountOperation, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "aborted")
      end
    end

    def aborted_signal
      AbortedSignal.new(self)
    end

    # Emitted when a mount operation asks the user for a password.
    #
    # If the message contains a line break, the first line should be
    # presented as a heading. For example, it may be used as the
    # primary text in a #GtkMessageDialog.
    struct AskPasswordSignal < GObject::Signal
      def name : String
        @detail ? "ask-password::#{@detail}" : "ask-password"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, ::String, ::String, Gio::AskPasswordFlags, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, ::String, ::String, Gio::AskPasswordFlags, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_default_user : Pointer(LibC::Char), lib_default_domain : Pointer(LibC::Char), lib_flags : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::BuiltInTypeArgPlan
          default_user = ::String.new(lib_default_user)
          # Generator::BuiltInTypeArgPlan
          default_domain = ::String.new(lib_default_domain)
          # Generator::BuiltInTypeArgPlan
          flags = Gio::AskPasswordFlags.new(lib_flags)
          ::Box(Proc(::String, ::String, ::String, Gio::AskPasswordFlags, Nil)).unbox(_lib_box).call(message, default_user, default_domain, flags)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, ::String, ::String, ::String, Gio::AskPasswordFlags, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_default_user : Pointer(LibC::Char), lib_default_domain : Pointer(LibC::Char), lib_flags : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::BuiltInTypeArgPlan
          default_user = ::String.new(lib_default_user)
          # Generator::BuiltInTypeArgPlan
          default_domain = ::String.new(lib_default_domain)
          # Generator::BuiltInTypeArgPlan
          flags = Gio::AskPasswordFlags.new(lib_flags)
          ::Box(Proc(Gio::MountOperation, ::String, ::String, ::String, Gio::AskPasswordFlags, Nil)).unbox(_lib_box).call(_sender, message, default_user, default_domain, flags)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(message : ::String, default_user : ::String, default_domain : ::String, flags : Gio::AskPasswordFlags) : Nil
        LibGObject.g_signal_emit_by_name(@source, "ask-password", message, default_user, default_domain, flags)
      end
    end

    def ask_password_signal
      AskPasswordSignal.new(self)
    end

    # Emitted when asking the user a question and gives a list of
    # choices for the user to choose from.
    #
    # If the message contains a line break, the first line should be
    # presented as a heading. For example, it may be used as the
    # primary text in a #GtkMessageDialog.
    struct AskQuestionSignal < GObject::Signal
      def name : String
        @detail ? "ask-question::#{@detail}" : "ask-question"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Enumerable(::String), Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_choices : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(::String, Enumerable(::String), Nil)).unbox(_lib_box).call(message, choices)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, ::String, Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_choices : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(Gio::MountOperation, ::String, Enumerable(::String), Nil)).unbox(_lib_box).call(_sender, message, choices)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(message : ::String, choices : Enumerable(::String)) : Nil
        # Generator::ArrayArgPlan
        choices = choices.to_a.map(&.to_unsafe).to_unsafe

        LibGObject.g_signal_emit_by_name(@source, "ask-question", message, choices)
      end
    end

    def ask_question_signal
      AskQuestionSignal.new(self)
    end

    # Emitted when the user has replied to the mount operation.
    struct ReplySignal < GObject::Signal
      def name : String
        @detail ? "reply::#{@detail}" : "reply"
      end

      def connect(*, after : Bool = false, &block : Proc(Gio::MountOperationResult, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gio::MountOperationResult, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_result : UInt32, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          result = Gio::MountOperationResult.new(lib_result)
          ::Box(Proc(Gio::MountOperationResult, Nil)).unbox(_lib_box).call(result)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, Gio::MountOperationResult, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_result : UInt32, _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          result = Gio::MountOperationResult.new(lib_result)
          ::Box(Proc(Gio::MountOperation, Gio::MountOperationResult, Nil)).unbox(_lib_box).call(_sender, result)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(result : Gio::MountOperationResult) : Nil
        LibGObject.g_signal_emit_by_name(@source, "reply", result)
      end
    end

    def reply_signal
      ReplySignal.new(self)
    end

    # Emitted when one or more processes are blocking an operation
    # e.g. unmounting/ejecting a #GMount or stopping a #GDrive.
    #
    # Note that this signal may be emitted several times to update the
    # list of blocking processes as processes close files. The
    # application should only respond with g_mount_operation_reply() to
    # the latest signal (setting #GMountOperation:choice to the choice
    # the user made).
    #
    # If the message contains a line break, the first line should be
    # presented as a heading. For example, it may be used as the
    # primary text in a #GtkMessageDialog.
    struct ShowProcessesSignal < GObject::Signal
      def name : String
        @detail ? "show-processes::#{@detail}" : "show-processes"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Enumerable(Int32), Enumerable(::String), Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Enumerable(Int32), Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_processes : Pointer(Int32), lib_choices : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(::String, Enumerable(Int32), Enumerable(::String), Nil)).unbox(_lib_box).call(message, processes, choices)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, ::String, Enumerable(Int32), Enumerable(::String), Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_processes : Pointer(Int32), lib_choices : Pointer(Pointer(LibC::Char)), _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          # Generator::ArrayArgPlan
          raise NotImplementedError.new
          ::Box(Proc(Gio::MountOperation, ::String, Enumerable(Int32), Enumerable(::String), Nil)).unbox(_lib_box).call(_sender, message, processes, choices)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(message : ::String, processes : Enumerable(Int32), choices : Enumerable(::String)) : Nil
        # Generator::ArrayArgPlan
        processes = processes.to_a.to_unsafe
        # Generator::ArrayArgPlan
        choices = choices.to_a.map(&.to_unsafe).to_unsafe

        LibGObject.g_signal_emit_by_name(@source, "show-processes", message, processes, choices)
      end
    end

    def show_processes_signal
      ShowProcessesSignal.new(self)
    end

    # Emitted when an unmount operation has been busy for more than some time
    # (typically 1.5 seconds).
    #
    # When unmounting or ejecting a volume, the kernel might need to flush
    # pending data in its buffers to the volume stable storage, and this operation
    # can take a considerable amount of time. This signal may be emitted several
    # times as long as the unmount operation is outstanding, and then one
    # last time when the operation is completed, with @bytes_left set to zero.
    #
    # Implementations of GMountOperation should handle this signal by
    # showing an UI notification, and then dismiss it, or show another notification
    # of completion, when @bytes_left reaches zero.
    #
    # If the message contains a line break, the first line should be
    # presented as a heading. For example, it may be used as the
    # primary text in a #GtkMessageDialog.
    struct ShowUnmountProgressSignal < GObject::Signal
      def name : String
        @detail ? "show-unmount-progress::#{@detail}" : "show-unmount-progress"
      end

      def connect(*, after : Bool = false, &block : Proc(::String, Int64, Int64, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(::String, Int64, Int64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_time_left : Int64, lib_bytes_left : Int64, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          time_left = lib_time_left
          bytes_left = lib_bytes_left
          ::Box(Proc(::String, Int64, Int64, Nil)).unbox(_lib_box).call(message, time_left, bytes_left)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gio::MountOperation, ::String, Int64, Int64, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_message : Pointer(LibC::Char), lib_time_left : Int64, lib_bytes_left : Int64, _lib_box : Pointer(Void)) {
          _sender = Gio::MountOperation.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          message = ::String.new(lib_message)
          time_left = lib_time_left
          bytes_left = lib_bytes_left
          ::Box(Proc(Gio::MountOperation, ::String, Int64, Int64, Nil)).unbox(_lib_box).call(_sender, message, time_left, bytes_left)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(message : ::String, time_left : Int64, bytes_left : Int64) : Nil
        LibGObject.g_signal_emit_by_name(@source, "show-unmount-progress", message, time_left, bytes_left)
      end
    end

    def show_unmount_progress_signal
      ShowUnmountProgressSignal.new(self)
    end
  end
end
