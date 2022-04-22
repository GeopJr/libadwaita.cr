module Gio
  # Structure used for scatter/gather data output when sending multiple
  # messages or packets in one go. You generally pass in an array of
  # #GOutputVectors and the operation will use all the buffers as if they
  # were one buffer.
  #
  # If @address is %NULL then the message is sent to the default receiver
  # (as previously set by g_socket_connect()).
  class OutputMessage
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::OutputMessage))
      @pointer.copy_from(pointer, sizeof(LibGio::OutputMessage))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(address : Gio::SocketAddress? = nil, vectors : Gio::OutputVector? = nil, num_vectors : UInt32? = nil, bytes_sent : UInt32? = nil, control_messages : Enumerable(Gio::SocketControlMessage)? = nil, num_control_messages : UInt32? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.address = address unless address.nil?
      _instance.vectors = vectors unless vectors.nil?
      _instance.num_vectors = num_vectors unless num_vectors.nil?
      _instance.bytes_sent = bytes_sent unless bytes_sent.nil?
      _instance.control_messages = control_messages unless control_messages.nil?
      _instance.num_control_messages = num_control_messages unless num_control_messages.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::OutputMessage)).zero?
    end

    def address!
      self.address.not_nil!
    end

    def address : Gio::SocketAddress?
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Gio::SocketAddress.new(_var.value, GICrystal::Transfer::None)
    end

    def address=(value : Gio::SocketAddress?)
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def vectors!
      self.vectors.not_nil!
    end

    def vectors : Gio::OutputVector?
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Gio::OutputVector.new(_var.value, GICrystal::Transfer::None)
    end

    def vectors=(value : Gio::OutputVector?)
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def num_vectors : UInt32
      _var = (@pointer + 16).as(Pointer(UInt32))
      _var.value
    end

    def num_vectors=(value : UInt32)
      _var = (@pointer + 16).as(Pointer(UInt32)).value = value
      value
    end

    def bytes_sent : UInt32
      _var = (@pointer + 20).as(Pointer(UInt32))
      _var.value
    end

    def bytes_sent=(value : UInt32)
      _var = (@pointer + 20).as(Pointer(UInt32)).value = value
      value
    end

    def control_messages!
      self.control_messages.not_nil!
    end

    def control_messages : Enumerable(Gio::SocketControlMessage)?
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void))))
      return if _var.value.null?
      GICrystal.transfer_array(_var.value, num_control_messages, GICrystal::Transfer::None)
    end

    def control_messages=(value : Enumerable(Gio::SocketControlMessage)?)
      _var = (@pointer + 24).as(Pointer(Pointer(Pointer(Void)))).value = value.nil? ? Pointer(Pointer(Void)).null : value
      value
    end

    def num_control_messages : UInt32
      _var = (@pointer + 32).as(Pointer(UInt32))
      _var.value
    end

    def num_control_messages=(value : UInt32)
      _var = (@pointer + 32).as(Pointer(UInt32)).value = value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
