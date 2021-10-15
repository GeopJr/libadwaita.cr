require "../g_object-2.0/object"

module Gio
  # A type for representing D-Bus messages that can be sent or received
  # on a #GDBusConnection.
  class DBusMessage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, locked : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if locked
        (_names.to_unsafe + _n).value = "locked".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, locked)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(DBusMessage.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_dbus_message_get_type
    end

    def initialize
      # g_dbus_message_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_new
      @pointer = _retval
    end

    def self.new_from_blob(blob : Enumerable(UInt8), capabilities : Gio::DBusCapabilityFlags) : Gio::DBusMessage
      # g_dbus_message_new_from_blob: (Constructor | Throws)
      # @blob: (array length=blob_len element-type UInt8)
      # Returns: (transfer full)

      blob_len = blob.size
      blob = blob.to_a.to_unsafe

      _retval = LibGio.g_dbus_message_new_from_blob(blob, blob_len, capabilities)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_method_call(name : ::String?, path : ::String, interface_ : ::String?, method : ::String) : Gio::DBusMessage
      # g_dbus_message_new_method_call: (Constructor)
      # @name: (nullable)
      # @interface_: (nullable)
      # Returns: (transfer full)

      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end
      interface_ = if interface_.nil?
                     Pointer(LibC::Char).null
                   else
                     interface_.to_unsafe
                   end

      _retval = LibGio.g_dbus_message_new_method_call(name, path, interface_, method)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_signal(path : ::String, interface_ : ::String, signal : ::String) : Gio::DBusMessage
      # g_dbus_message_new_signal: (Constructor)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_new_signal(path, interface_, signal)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def bytes_needed(blob : Enumerable(UInt8)) : Int64
      # g_dbus_message_bytes_needed: (Throws)
      # @blob: (array length=blob_len element-type UInt8)
      # Returns: (transfer none)

      blob_len = blob.size
      blob = blob.to_a.to_unsafe

      _retval = LibGio.g_dbus_message_bytes_needed(blob, blob_len)
      _retval
    end

    def bytes_needed(*blob : UInt8)
      bytes_needed(blob)
    end

    def copy : Gio::DBusMessage
      # g_dbus_message_copy: (Method | Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_copy(self)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def arg0 : ::String?
      # g_dbus_message_get_arg0: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_arg0(self)
      ::String.new(_retval) unless _retval.null?
    end

    def body : GLib::Variant?
      # g_dbus_message_get_body: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_body(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def byte_order : Gio::DBusMessageByteOrder
      # g_dbus_message_get_byte_order: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_byte_order(self)
      Gio::DBusMessageByteOrder.from_value(_retval)
    end

    def destination : ::String?
      # g_dbus_message_get_destination: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_destination(self)
      ::String.new(_retval) unless _retval.null?
    end

    def error_name : ::String?
      # g_dbus_message_get_error_name: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_error_name(self)
      ::String.new(_retval) unless _retval.null?
    end

    def flags : Gio::DBusMessageFlags
      # g_dbus_message_get_flags: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_flags(self)
      Gio::DBusMessageFlags.from_value(_retval)
    end

    def header(header_field : Gio::DBusMessageHeaderField) : GLib::Variant?
      # g_dbus_message_get_header: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_header(self, header_field)
      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def header_fields : Enumerable(UInt8)
      # g_dbus_message_get_header_fields: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_header_fields(self)
      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    def interface : ::String?
      # g_dbus_message_get_interface: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_interface(self)
      ::String.new(_retval) unless _retval.null?
    end

    def locked? : Bool
      # g_dbus_message_get_locked: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_locked(self)
      GICrystal.to_bool(_retval)
    end

    def member : ::String?
      # g_dbus_message_get_member: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_member(self)
      ::String.new(_retval) unless _retval.null?
    end

    def message_type : Gio::DBusMessageType
      # g_dbus_message_get_message_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_message_type(self)
      Gio::DBusMessageType.from_value(_retval)
    end

    def num_unix_fds : UInt32
      # g_dbus_message_get_num_unix_fds: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_num_unix_fds(self)
      _retval
    end

    def path : ::String?
      # g_dbus_message_get_path: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_path(self)
      ::String.new(_retval) unless _retval.null?
    end

    def reply_serial : UInt32
      # g_dbus_message_get_reply_serial: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_reply_serial(self)
      _retval
    end

    def sender : ::String?
      # g_dbus_message_get_sender: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_sender(self)
      ::String.new(_retval) unless _retval.null?
    end

    def serial : UInt32
      # g_dbus_message_get_serial: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_serial(self)
      _retval
    end

    def signature : ::String
      # g_dbus_message_get_signature: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_signature(self)
      ::String.new(_retval)
    end

    def unix_fd_list : Gio::UnixFDList?
      # g_dbus_message_get_unix_fd_list: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_get_unix_fd_list(self)
      Gio::UnixFDList.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def lock : Nil
      # g_dbus_message_lock: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_lock(self)
    end

    def new_method_error_literal(error_name : ::String, error_message : ::String) : Gio::DBusMessage
      # g_dbus_message_new_method_error_literal: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_new_method_error_literal(self, error_name, error_message)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def new_method_reply : Gio::DBusMessage
      # g_dbus_message_new_method_reply: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_new_method_reply(self)
      Gio::DBusMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def print(indent : UInt32) : ::String
      # g_dbus_message_print: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_print(self, indent)
      GICrystal.transfer_full(_retval)
    end

    def body=(body : _) : Nil
      # g_dbus_message_set_body: (Method)
      # Returns: (transfer none)

      body = GLib::Variant.new(body) unless body.is_a?(GLib::Variant)

      LibGio.g_dbus_message_set_body(self, body)
    end

    def byte_order=(byte_order : Gio::DBusMessageByteOrder) : Nil
      # g_dbus_message_set_byte_order: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_byte_order(self, byte_order)
    end

    def destination=(value : ::String?) : Nil
      # g_dbus_message_set_destination: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_destination(self, value)
    end

    def error_name=(value : ::String) : Nil
      # g_dbus_message_set_error_name: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_error_name(self, value)
    end

    def flags=(flags : Gio::DBusMessageFlags) : Nil
      # g_dbus_message_set_flags: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_flags(self, flags)
    end

    def set_header(header_field : Gio::DBusMessageHeaderField, value : _?) : Nil
      # g_dbus_message_set_header: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(Void).null
              else
                value.to_unsafe
              end
      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      LibGio.g_dbus_message_set_header(self, header_field, value)
    end

    def interface=(value : ::String?) : Nil
      # g_dbus_message_set_interface: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_interface(self, value)
    end

    def member=(value : ::String?) : Nil
      # g_dbus_message_set_member: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_member(self, value)
    end

    def message_type=(type : Gio::DBusMessageType) : Nil
      # g_dbus_message_set_message_type: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_message_type(self, type)
    end

    def num_unix_fds=(value : UInt32) : Nil
      # g_dbus_message_set_num_unix_fds: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_num_unix_fds(self, value)
    end

    def path=(value : ::String?) : Nil
      # g_dbus_message_set_path: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_path(self, value)
    end

    def reply_serial=(value : UInt32) : Nil
      # g_dbus_message_set_reply_serial: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_reply_serial(self, value)
    end

    def sender=(value : ::String?) : Nil
      # g_dbus_message_set_sender: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_sender(self, value)
    end

    def serial=(serial : UInt32) : Nil
      # g_dbus_message_set_serial: (Method)
      # Returns: (transfer none)

      LibGio.g_dbus_message_set_serial(self, serial)
    end

    def signature=(value : ::String?) : Nil
      # g_dbus_message_set_signature: (Method)
      # @value: (nullable)
      # Returns: (transfer none)

      value = if value.nil?
                Pointer(LibC::Char).null
              else
                value.to_unsafe
              end

      LibGio.g_dbus_message_set_signature(self, value)
    end

    def unix_fd_list=(fd_list : Gio::UnixFDList?) : Nil
      # g_dbus_message_set_unix_fd_list: (Method)
      # @fd_list: (nullable)
      # Returns: (transfer none)

      fd_list = if fd_list.nil?
                  Pointer(Void).null
                else
                  fd_list.to_unsafe
                end

      LibGio.g_dbus_message_set_unix_fd_list(self, fd_list)
    end

    def to_blob(out_size : UInt64, capabilities : Gio::DBusCapabilityFlags) : Enumerable(UInt8)
      # g_dbus_message_to_blob: (Method | Throws)
      # @out_size: (out) (transfer full)
      # Returns: (transfer full)

      _retval = LibGio.g_dbus_message_to_blob(self, out_size, capabilities)
      _retval
    end

    def to_gerror : Bool
      # g_dbus_message_to_gerror: (Method | Throws)
      # Returns: (transfer none)

      _retval = LibGio.g_dbus_message_to_gerror(self)
      GICrystal.to_bool(_retval)
    end
  end
end
