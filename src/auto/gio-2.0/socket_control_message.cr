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
  @[GObject::GeneratedWrapper]
  class SocketControlMessage < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SocketControlMessageClass), class_init,
        sizeof(LibGio::SocketControlMessage), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_socket_control_message_get_type
    end

    # Tries to deserialize a socket control message of a given
    # @level and @type. This will ask all known (to GType) subclasses
    # of #GSocketControlMessage if they can understand this kind
    # of message and if so deserialize it into a #GSocketControlMessage.
    #
    # If there is no implementation for this kind of control message, %NULL
    # will be returned.
    def self.deserialize(level : Int32, type : Int32, data : Enumerable(UInt8)) : Gio::SocketControlMessage
      # g_socket_control_message_deserialize: (None)
      # @data: (array length=size element-type UInt8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      size = data.size
      # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      _retval = LibGio.g_socket_control_message_deserialize(level, type, size, data)

      # Return value handling

      Gio::SocketControlMessage.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the "level" (i.e. the originating protocol) of the control message.
    # This is often SOL_SOCKET.
    def level : Int32
      # g_socket_control_message_get_level: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_control_message_get_level(self)

      # Return value handling

      _retval
    end

    # Returns the protocol specific type of the control message.
    # For instance, for UNIX fd passing this would be SCM_RIGHTS.
    def msg_type : Int32
      # g_socket_control_message_get_msg_type: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_control_message_get_msg_type(self)

      # Return value handling

      _retval
    end

    # Returns the space required for the control message, not including
    # headers or alignment.
    def size : UInt64
      # g_socket_control_message_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_socket_control_message_get_size(self)

      # Return value handling

      _retval
    end

    # Converts the data in the message to bytes placed in the
    # message.
    #
    # @data is guaranteed to have enough space to fit the size
    # returned by g_socket_control_message_get_size() on this
    # object.
    def serialize(data : Pointer(Void)) : Nil
      # g_socket_control_message_serialize: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_socket_control_message_serialize(self, data)

      # Return value handling
    end
  end
end
