module Gio
  # Structure used for scatter/gather data input when receiving multiple
  # messages or packets in one go. You generally pass in an array of empty
  # #GInputVectors and the operation will use all the buffers as if they
  # were one buffer, and will set @bytes_received to the total number of bytes
  # received across all #GInputVectors.
  #
  # This structure closely mirrors `struct mmsghdr` and `struct msghdr` from
  # the POSIX sockets API (see `man 2 recvmmsg`).
  #
  # If @address is non-%NULL then it is set to the source address the message
  # was received from, and the caller must free it afterwards.
  #
  # If @control_messages is non-%NULL then it is set to an array of control
  # messages received with the message (if any), and the caller must free it
  # afterwards. @num_control_messages is set to the number of elements in
  # this array, which may be zero.
  #
  # Flags relevant to this message will be returned in @flags. For example,
  # `MSG_EOR` or `MSG_TRUNC`.
  class InputMessage
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::InputMessage))
      @pointer.copy_from(pointer, sizeof(LibGio::InputMessage))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(address : Gio::SocketAddress? = nil, vectors : Enumerable(Gio::InputVector)? = nil, num_vectors : UInt32? = nil, bytes_received : UInt64? = nil, flags : Int32? = nil, control_messages : Enumerable(Gio::SocketControlMessage)? = nil, num_control_messages : Pointer(UInt32)? = nil)
      _ptr = Pointer(Void).malloc(56)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.address = address unless address.nil?
      _instance.vectors = vectors unless vectors.nil?
      _instance.num_vectors = num_vectors unless num_vectors.nil?
      _instance.bytes_received = bytes_received unless bytes_received.nil?
      _instance.flags = flags unless flags.nil?
      _instance.control_messages = control_messages unless control_messages.nil?
      _instance.num_control_messages = num_control_messages unless num_control_messages.nil?
      _instance
    end

    def finalize
    end

    def address : Gio::SocketAddress
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibGio::SocketAddress)))
      Gio::SocketAddress.new(_var.value, GICrystal::Transfer::Full)
    end

    def address=(value : Gio::SocketAddress)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibGio::SocketAddress))).value = value.to_unsafe
      value
    end

    def vectors : Enumerable(Gio::InputVector)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      _var.value
    end

    def vectors=(value : Enumerable(Gio::InputVector))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value
      value
    end

    def num_vectors : UInt32
      # Property getter
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def num_vectors=(value : UInt32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def bytes_received : UInt64
      # Property getter
      _var = (@pointer + 24).as(Pointer(UInt64))
      _var.value
    end

    def bytes_received=(value : UInt64)
      # Property setter
      _var = (@pointer + 24).as(Pointer(UInt64)).value = value
      value
    end

    def flags : Int32
      # Property getter
      _var = (@pointer + 32).as(Pointer(Int32))
      _var.value
    end

    def flags=(value : Int32)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Int32)).value = value
      value
    end

    def control_messages : Enumerable(Gio::SocketControlMessage)
      # Property getter
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(Void))))
      _var.value
    end

    def control_messages=(value : Enumerable(Gio::SocketControlMessage))
      # Property setter
      _var = (@pointer + 40).as(Pointer(Pointer(Pointer(Void)))).value = value
      value
    end

    def num_control_messages : Pointer(UInt32)
      # Property getter
      _var = (@pointer + 48).as(Pointer(Pointer(UInt32)))
      _var.value
    end

    def num_control_messages=(value : Pointer(UInt32))
      # Property setter
      _var = (@pointer + 48).as(Pointer(Pointer(UInt32))).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
