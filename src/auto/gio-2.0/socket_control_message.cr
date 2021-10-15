require "../g_object-2.0/object"

module Gio
  # A #GSocketControlMessage is a special-purpose utility message that
  # can be sent to or received from a #GSocket. These types of
  # messages are often called "ancillary data".
  #
  # The message can represent some sort of special instruction to or
  # information from the socket or can represent a special kind of
  # transfer to the peer (for example, sending a file descriptor over
  # a UNIX socket).
  #
  # These messages are sent with g_socket_send_message() and received
  # with g_socket_receive_message().
  #
  # To extend the set of control message that can be sent, subclass this
  # class and override the get_size, get_level, get_type and serialize
  # methods.
  #
  # To extend the set of control messages that can be received, subclass
  # this class and implement the deserialize method. Also, make sure your
  # class is registered with the GType typesystem before calling
  # g_socket_receive_message() to read such a message.
  class SocketControlMessage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_control_message_get_type
    end

    def self.deserialize(level : Int32, type : Int32, data : Enumerable(UInt8)) : Gio::SocketControlMessage
      # g_socket_control_message_deserialize: (None)
      # @data: (array length=size element-type UInt8)
      # Returns: (transfer full)

      size = data.size
      data = data.to_a.to_unsafe

      _retval = LibGio.g_socket_control_message_deserialize(level, type, size, data)
      Gio::SocketControlMessage.new(_retval, GICrystal::Transfer::Full)
    end

    def level : Int32
      # g_socket_control_message_get_level: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_control_message_get_level(self)
      _retval
    end

    def msg_type : Int32
      # g_socket_control_message_get_msg_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_control_message_get_msg_type(self)
      _retval
    end

    def size : UInt64
      # g_socket_control_message_get_size: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_socket_control_message_get_size(self)
      _retval
    end

    def serialize(data : Pointer(Nil)) : Nil
      # g_socket_control_message_serialize: (Method)
      # Returns: (transfer none)

      LibGio.g_socket_control_message_serialize(self, data)
    end
  end
end
