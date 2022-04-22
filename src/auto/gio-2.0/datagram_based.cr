module Gio
  # A #GDatagramBased is a networking interface for representing datagram-based
  # communications. It is a more or less direct mapping of the core parts of the
  # BSD socket API in a portable GObject interface. It is implemented by
  # #GSocket, which wraps the UNIX socket API on UNIX and winsock2 on Windows.
  #
  # #GDatagramBased is entirely platform independent, and is intended to be used
  # alongside higher-level networking APIs such as #GIOStream.
  #
  # It uses vectored scatter/gather I/O by default, allowing for many messages
  # to be sent or received in a single call. Where possible, implementations of
  # the interface should take advantage of vectored I/O to minimise processing
  # or system calls. For example, #GSocket uses recvmmsg() and sendmmsg() where
  # possible. Callers should take advantage of scatter/gather I/O (the use of
  # multiple buffers per message) to avoid unnecessary copying of data to
  # assemble or disassemble a message.
  #
  # Each #GDatagramBased operation has a timeout parameter which may be negative
  # for blocking behaviour, zero for non-blocking behaviour, or positive for
  # timeout behaviour. A blocking operation blocks until finished or there is an
  # error. A non-blocking operation will return immediately with a
  # %G_IO_ERROR_WOULD_BLOCK error if it cannot make progress. A timeout operation
  # will block until the operation is complete or the timeout expires; if the
  # timeout expires it will return what progress it made, or
  # %G_IO_ERROR_TIMED_OUT if no progress was made. To know when a call would
  # successfully run you can call g_datagram_based_condition_check() or
  # g_datagram_based_condition_wait(). You can also use
  # g_datagram_based_create_source() and attach it to a #GMainContext to get
  # callbacks when I/O is possible.
  #
  # When running a non-blocking operation applications should always be able to
  # handle getting a %G_IO_ERROR_WOULD_BLOCK error even when some other function
  # said that I/O was possible. This can easily happen in case of a race
  # condition in the application, but it can also happen for other reasons. For
  # instance, on Windows a socket is always seen as writable until a write
  # returns %G_IO_ERROR_WOULD_BLOCK.
  #
  # As with #GSocket, #GDatagramBaseds can be either connection oriented (for
  # example, SCTP) or connectionless (for example, UDP). #GDatagramBaseds must be
  # datagram-based, not stream-based. The interface does not cover connection
  # establishment — use methods on the underlying type to establish a connection
  # before sending and receiving data through the #GDatagramBased API. For
  # connectionless socket types the target/source address is specified or
  # received in each I/O operation.
  #
  # Like most other APIs in GLib, #GDatagramBased is not inherently thread safe.
  # To use a #GDatagramBased concurrently from multiple threads, you must
  # implement your own locking.
  module DatagramBased
    def condition_check(condition : GLib::IOCondition) : GLib::IOCondition
      # g_datagram_based_condition_check: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_datagram_based_condition_check(self, condition)

      # Return value handling

      GLib::IOCondition.new(_retval)
    end

    def condition_wait(condition : GLib::IOCondition, timeout : Int64, cancellable : Gio::Cancellable?) : Bool
      # g_datagram_based_condition_wait: (Method | Throws)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_datagram_based_condition_wait(self, condition, timeout, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def create_source(condition : GLib::IOCondition, cancellable : Gio::Cancellable?) : GLib::Source
      # g_datagram_based_create_source: (Method)
      # @cancellable: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_datagram_based_create_source(self, condition, cancellable)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    def receive_messages(messages : Enumerable(Gio::InputMessage), flags : Int32, timeout : Int64, cancellable : Gio::Cancellable?) : Int32
      # g_datagram_based_receive_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      num_messages = messages.size
      # Generator::ArrayArgPlan
      messages = messages.to_a.map(&.to_unsafe).to_unsafe

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_datagram_based_receive_messages(self, messages, num_messages, flags, timeout, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    def send_messages(messages : Enumerable(Gio::OutputMessage), flags : Int32, timeout : Int64, cancellable : Gio::Cancellable?) : Int32
      # g_datagram_based_send_messages: (Method | Throws)
      # @messages: (array length=num_messages element-type Interface)
      # @cancellable: (nullable)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # Generator::ArrayLengthArgPlan
      num_messages = messages.size
      # Generator::ArrayArgPlan
      messages = messages.to_a.map(&.to_unsafe).to_unsafe

      # Generator::NullableArrayPlan
      cancellable = if cancellable.nil?
                      Pointer(Void).null
                    else
                      cancellable.to_unsafe
                    end

      # C call
      _retval = LibGio.g_datagram_based_send_messages(self, messages, num_messages, flags, timeout, cancellable, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      _retval
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class DatagramBased__Impl < GObject::Object
    include DatagramBased

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_datagram_based_get_type
    end

    # Cast a `GObject::Object` to `DatagramBased`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to DatagramBased")
    end

    # Cast a `GObject::Object` to `DatagramBased`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
