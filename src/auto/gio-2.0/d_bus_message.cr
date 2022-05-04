require "../g_object-2.0/object"

module Gio
  # A type for representing D-Bus messages that can be sent or received
  # on a #GDBusConnection.
  @[GObject::GeneratedWrapper]
  class DBusMessage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGio::DBusMessage), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, locked : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !locked.nil?
        (_names.to_unsafe + _n).value = "locked".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, locked)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusMessage.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_message_get_type
    end

    def locked? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "locked", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new empty #GDBusMessage.
    def initialize
      # g_dbus_message_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_message_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new #GDBusMessage from the data stored at @blob. The byte
    # order that the message was in can be retrieved using
    # g_dbus_message_get_byte_order().
    #
    # If the @blob cannot be parsed, contains invalid fields, or contains invalid
    # headers, %G_IO_ERROR_INVALID_ARGUMENT will be returned.
    def self.new_from_blob(blob : Enumerable(UInt8), capabilities : Gio::DBusCapabilityFlags) : self
      # g_dbus_message_new_from_blob: (Constructor | Throws)
      # @blob: (array length=blob_len element-type UInt8)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      blob_len = blob.size # Generator::ArrayArgPlan
      blob = blob.to_a.to_unsafe

      # C call
      _retval = LibGio.g_dbus_message_new_from_blob(blob, blob_len, capabilities, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GDBusMessage for a method call.
    def self.new_method_call(name : ::String?, path : ::String, interface_ : ::String?, method : ::String) : self
      # g_dbus_message_new_method_call: (Constructor)
      # @name: (nullable)
      # @interface_: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      # Generator::NullableArrayPlan
      interface_ = if interface_.nil?
                     Pointer(LibC::Char).null
                   else
                     interface_.to_unsafe
                   end

      # C call
      _retval = LibGio.g_dbus_message_new_method_call(name, path, interface_, method)

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GDBusMessage for a signal emission.
    def self.new_signal(path : ::String, interface_ : ::String, signal : ::String) : self
      # g_dbus_message_new_signal: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_message_new_signal(path, interface_, signal)

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def bytes_needed(blob : Enumerable(UInt8)) : Int64
      # g_dbus_message_bytes_needed: (Throws)
      # @blob: (array length=blob_len element-type UInt8)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      blob_len = blob.size # Generator::ArrayArgPlan
      blob = blob.to_a.to_unsafe

      # C call
      _retval = LibGio.g_dbus_message_bytes_needed(blob, blob_len, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    def bytes_needed(*blob : UInt8)
      bytes_needed(blob)
    end

    # Copies @message. The copy is a deep copy and the returned
    # #GDBusMessage is completely identical except that it is guaranteed
    # to not be locked.
    #
    # This operation can fail if e.g. @message contains file descriptors
    # and the per-process or system-wide open files limit is reached.
    def copy : Gio::DBusMessage
      # g_dbus_message_copy: (Method | Throws)
      # Returns: (transfer full)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_message_copy(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Convenience to get the first item in the body of @message.
    def arg0 : ::String?
      # g_dbus_message_get_arg0: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_arg0(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the body of a message.
    def body : GLib::Variant?
      # g_dbus_message_get_body: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_body(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the byte order of @message.
    def byte_order : Gio::DBusMessageByteOrder
      # g_dbus_message_get_byte_order: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_byte_order(self)

      # Return value handling

      Gio::DBusMessageByteOrder.new(_retval)
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field.
    def destination : ::String?
      # g_dbus_message_get_destination: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_destination(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field.
    def error_name : ::String?
      # g_dbus_message_get_error_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_error_name(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the flags for @message.
    def flags : Gio::DBusMessageFlags
      # g_dbus_message_get_flags: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_flags(self)

      # Return value handling

      Gio::DBusMessageFlags.new(_retval)
    end

    # Gets a header field on @message.
    #
    # The caller is responsible for checking the type of the returned #GVariant
    # matches what is expected.
    def header(header_field : Gio::DBusMessageHeaderField) : GLib::Variant?
      # g_dbus_message_get_header: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_header(self, header_field)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets an array of all header fields on @message that are set.
    def header_fields : Enumerable(UInt8)
      # g_dbus_message_get_header_fields: (Method)
      # Returns: (transfer none) (array zero-terminated=1 element-type UInt8)

      # C call
      _retval = LibGio.g_dbus_message_get_header_fields(self)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field.
    def interface : ::String?
      # g_dbus_message_get_interface: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_interface(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Checks whether @message is locked. To monitor changes to this
    # value, conncet to the #GObject::notify signal to listen for changes
    # on the #GDBusMessage:locked property.
    def locked : Bool
      # g_dbus_message_get_locked: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_locked(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field.
    def member : ::String?
      # g_dbus_message_get_member: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_member(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the type of @message.
    def message_type : Gio::DBusMessageType
      # g_dbus_message_get_message_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_message_type(self)

      # Return value handling

      Gio::DBusMessageType.new(_retval)
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field.
    def num_unix_fds : UInt32
      # g_dbus_message_get_num_unix_fds: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_num_unix_fds(self)

      # Return value handling

      _retval
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field.
    def path : ::String?
      # g_dbus_message_get_path: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_path(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field.
    def reply_serial : UInt32
      # g_dbus_message_get_reply_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_reply_serial(self)

      # Return value handling

      _retval
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field.
    def sender : ::String?
      # g_dbus_message_get_sender: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_sender(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the serial for @message.
    def serial : UInt32
      # g_dbus_message_get_serial: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_serial(self)

      # Return value handling

      _retval
    end

    # Convenience getter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field.
    #
    # This will always be non-%NULL, but may be an empty string.
    def signature : ::String
      # g_dbus_message_get_signature: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_signature(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the UNIX file descriptors associated with @message, if any.
    #
    # This method is only available on UNIX.
    #
    # The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
    # values in the body of the message. For example,
    # if g_variant_get_handle() returns 5, that is intended to be a reference
    # to the file descriptor that can be accessed by
    # `g_unix_fd_list_get (list, 5, ...)`.
    def unix_fd_list : Gio::UnixFDList?
      # g_dbus_message_get_unix_fd_list: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_dbus_message_get_unix_fd_list(self)

      # Return value handling

      Gio::UnixFDList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # If @message is locked, does nothing. Otherwise locks the message.
    def lock : Nil
      # g_dbus_message_lock: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_lock(self)

      # Return value handling
    end

    # Creates a new #GDBusMessage that is an error reply to @method_call_message.
    def new_method_error_literal(error_name : ::String, error_message : ::String) : Gio::DBusMessage
      # g_dbus_message_new_method_error_literal: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_message_new_method_error_literal(self, error_name, error_message)

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new #GDBusMessage that is a reply to @method_call_message.
    def new_method_reply : Gio::DBusMessage
      # g_dbus_message_new_method_reply: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_message_new_method_reply(self)

      # Return value handling

      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Produces a human-readable multi-line description of @message.
    #
    # The contents of the description has no ABI guarantees, the contents
    # and formatting is subject to change at any time. Typical output
    # looks something like this:
    # |[
    # Flags:   none
    # Version: 0
    # Serial:  4
    # Headers:
    #   path -> objectpath '/org/gtk/GDBus/TestObject'
    #   interface -> 'org.gtk.GDBus.TestInterface'
    #   member -> 'GimmeStdout'
    #   destination -> ':1.146'
    # Body: ()
    # UNIX File Descriptors:
    #   (none)
    # ]|
    # or
    # |[
    # Flags:   no-reply-expected
    # Version: 0
    # Serial:  477
    # Headers:
    #   reply-serial -> uint32 4
    #   destination -> ':1.159'
    #   sender -> ':1.146'
    #   num-unix-fds -> uint32 1
    # Body: ()
    # UNIX File Descriptors:
    #   fd 12: dev=0:10,mode=020620,ino=5,uid=500,gid=5,rdev=136:2,size=0,atime=1273085037,mtime=1273085851,ctime=1272982635
    # ]|
    def print(indent : UInt32) : ::String
      # g_dbus_message_print: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_dbus_message_print(self, indent)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Sets the body @message. As a side-effect the
    # %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field is set to the
    # type string of @body (or cleared if @body is %NULL).
    #
    # If @body is floating, @message assumes ownership of @body.
    def body=(body : _) : Nil
      # g_dbus_message_set_body: (Method)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      body = if !body.is_a?(GLib::Variant)
               GLib::Variant.new(body).to_unsafe
             else
               body.to_unsafe
             end

      # C call
      LibGio.g_dbus_message_set_body(self, body)

      # Return value handling
    end

    # Sets the byte order of @message.
    def byte_order=(byte_order : Gio::DBusMessageByteOrder) : Nil
      # g_dbus_message_set_byte_order: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_byte_order(self, byte_order)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION header field.
    def destination=(value : ::String?) : Nil
      # g_dbus_message_set_destination: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_destination(self, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field.
    def error_name=(value : ::String) : Nil
      # g_dbus_message_set_error_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_error_name(self, value)

      # Return value handling
    end

    # Sets the flags to set on @message.
    def flags=(flags : Gio::DBusMessageFlags) : Nil
      # g_dbus_message_set_flags: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_flags(self, flags)

      # Return value handling
    end

    # Sets a header field on @message.
    #
    # If @value is floating, @message assumes ownership of @value.
    def set_header(header_field : Gio::DBusMessageHeaderField, value : _?) : Nil
      # g_dbus_message_set_header: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      value = if value.nil?
                Pointer(Void).null
              elsif !value.is_a?(GLib::Variant)
                GLib::Variant.new(value).to_unsafe
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_header(self, header_field, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE header field.
    def interface=(value : ::String?) : Nil
      # g_dbus_message_set_interface: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_interface(self, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_MEMBER header field.
    def member=(value : ::String?) : Nil
      # g_dbus_message_set_member: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_member(self, value)

      # Return value handling
    end

    # Sets @message to be of @type.
    def message_type=(type : Gio::DBusMessageType) : Nil
      # g_dbus_message_set_message_type: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_message_type(self, type)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header field.
    def num_unix_fds=(value : UInt32) : Nil
      # g_dbus_message_set_num_unix_fds: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_num_unix_fds(self, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_PATH header field.
    def path=(value : ::String?) : Nil
      # g_dbus_message_set_path: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_path(self, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL header field.
    def reply_serial=(value : UInt32) : Nil
      # g_dbus_message_set_reply_serial: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_reply_serial(self, value)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SENDER header field.
    def sender=(value : ::String?) : Nil
      # g_dbus_message_set_sender: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_sender(self, value)

      # Return value handling
    end

    # Sets the serial for @message.
    def serial=(serial : UInt32) : Nil
      # g_dbus_message_set_serial: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_dbus_message_set_serial(self, serial)

      # Return value handling
    end

    # Convenience setter for the %G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE header field.
    def signature=(value : ::String?) : Nil
      # g_dbus_message_set_signature: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      # C call
      LibGio.g_dbus_message_set_signature(self, value)

      # Return value handling
    end

    # Sets the UNIX file descriptors associated with @message. As a
    # side-effect the %G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS header
    # field is set to the number of fds in @fd_list (or cleared if
    # @fd_list is %NULL).
    #
    # This method is only available on UNIX.
    #
    # When designing D-Bus APIs that are intended to be interoperable,
    # please note that non-GDBus implementations of D-Bus can usually only
    # access file descriptors if they are referenced by a value of type
    # %G_VARIANT_TYPE_HANDLE in the body of the message.
    def unix_fd_list=(fd_list : Gio::UnixFDList?) : Nil
      # g_dbus_message_set_unix_fd_list: (Method)
      # @fd_list: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
                end

      # C call
      LibGio.g_dbus_message_set_unix_fd_list(self, fd_list)

      # Return value handling
    end

    # Serializes @message to a blob. The byte order returned by
    # g_dbus_message_get_byte_order() will be used.
    def to_blob(capabilities : Gio::DBusCapabilityFlags) : Enumerable(UInt8)
      # g_dbus_message_to_blob: (Method | Throws)
      # @out_size: (out) (transfer full)
      # Returns: (transfer full) (array length=out_size element-type UInt8)

      _error = Pointer(LibGLib::Error).null

      # Generator::OutArgUsedInReturnPlan
      out_size = 0_u64
      # C call
      _retval = LibGio.g_dbus_message_to_blob(self, pointerof(out_size), capabilities, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.transfer_array(_retval, out_size, GICrystal::Transfer::Full)
    end

    # If @message is not of type %G_DBUS_MESSAGE_TYPE_ERROR does
    # nothing and returns %FALSE.
    #
    # Otherwise this method encodes the error in @message as a #GError
    # using g_dbus_error_set_dbus_error() using the information in the
    # %G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME header field of @message as
    # well as the first string item in @message's body.
    def to_gerror : Bool
      # g_dbus_message_to_gerror: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_dbus_message_to_gerror(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end
  end
end
