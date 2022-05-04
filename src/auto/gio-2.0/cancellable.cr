require "../g_object-2.0/object"

module Gio
  # GCancellable is a thread-safe operation cancellation stack used
  # throughout GIO to allow for cancellation of synchronous and
  # asynchronous operations.
  @[GObject::GeneratedWrapper]
  class Cancellable < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::CancellableClass), class_init,
        sizeof(LibGio::Cancellable), instance_init, 0)
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

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_cancellable_get_type
    end

    # Creates a new #GCancellable object.
    #
    # Applications that want to start one or more operations
    # that should be cancellable should create a #GCancellable
    # and pass it to the operations.
    #
    # One #GCancellable can be used in multiple consecutive
    # operations or in multiple concurrent operations.
    def initialize
      # g_cancellable_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_cancellable_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the top cancellable from the stack.
    def self.current : Gio::Cancellable?
      # g_cancellable_get_current: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_cancellable_get_current

      # Return value handling

      Gio::Cancellable.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Will set @cancellable to cancelled, and will emit the
    # #GCancellable::cancelled signal. (However, see the warning about
    # race conditions in the documentation for that signal if you are
    # planning to connect to it.)
    #
    # This function is thread-safe. In other words, you can safely call
    # it from a thread other than the one running the operation that was
    # passed the @cancellable.
    #
    # If @cancellable is %NULL, this function returns immediately for convenience.
    #
    # The convention within GIO is that cancelling an asynchronous
    # operation causes it to complete asynchronously. That is, if you
    # cancel the operation from the same thread in which it is running,
    # then the operation's #GAsyncReadyCallback will not be invoked until
    # the application returns to the main loop.
    def cancel : Nil
      # g_cancellable_cancel: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_cancel(self)

      # Return value handling
    end

    # Convenience function to connect to the #GCancellable::cancelled
    # signal. Also handles the race condition that may happen
    # if the cancellable is cancelled right before connecting.
    #
    # @callback is called at most once, either directly at the
    # time of the connect if @cancellable is already cancelled,
    # or when @cancellable is cancelled in some thread.
    #
    # @data_destroy_func will be called when the handler is
    # disconnected, or immediately if the cancellable is already
    # cancelled.
    #
    # See #GCancellable::cancelled for details on how to use this.
    #
    # Since GLib 2.40, the lock protecting @cancellable is not held when
    # @callback is invoked.  This lifts a restriction in place for
    # earlier GLib versions which now makes it easier to write cleanup
    # code that unconditionally invokes e.g. g_cancellable_cancel().
    def connect(callback : GObject::Callback) : UInt64
      # g_cancellable_connect: (Method)
      # @data: (nullable)
      # @data_destroy_func: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if callback
        _box = ::Box.box(callback)
        callback = ->{
          ::Box(Proc(Nil)).unbox(Pointer(Void).null).call
        }.pointer
        data = GICrystal::ClosureDataManager.register(_box)
        data_destroy_func = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        callback = data = data_destroy_func = Pointer(Void).null
      end

      # C call
      _retval = LibGio.g_cancellable_connect(self, callback, data, data_destroy_func)

      # Return value handling

      _retval
    end

    # Disconnects a handler from a cancellable instance similar to
    # g_signal_handler_disconnect().  Additionally, in the event that a
    # signal handler is currently running, this call will block until the
    # handler has finished.  Calling this function from a
    # #GCancellable::cancelled signal handler will therefore result in a
    # deadlock.
    #
    # This avoids a race condition where a thread cancels at the
    # same time as the cancellable operation is finished and the
    # signal handler is removed. See #GCancellable::cancelled for
    # details on how to use this.
    #
    # If @cancellable is %NULL or @handler_id is `0` this function does
    # nothing.
    def disconnect(handler_id : UInt64) : Nil
      # g_cancellable_disconnect: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_disconnect(self, handler_id)

      # Return value handling
    end

    # Gets the file descriptor for a cancellable job. This can be used to
    # implement cancellable operations on Unix systems. The returned fd will
    # turn readable when @cancellable is cancelled.
    #
    # You are not supposed to read from the fd yourself, just check for
    # readable status. Reading to unset the readable status is done
    # with g_cancellable_reset().
    #
    # After a successful return from this function, you should use
    # g_cancellable_release_fd() to free up resources allocated for
    # the returned file descriptor.
    #
    # See also g_cancellable_make_pollfd().
    def fd : Int32
      # g_cancellable_get_fd: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_cancellable_get_fd(self)

      # Return value handling

      _retval
    end

    # Checks if a cancellable job has been cancelled.
    def is_cancelled : Bool
      # g_cancellable_is_cancelled: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_cancellable_is_cancelled(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a #GPollFD corresponding to @cancellable; this can be passed
    # to g_poll() and used to poll for cancellation. This is useful both
    # for unix systems without a native poll and for portability to
    # windows.
    #
    # When this function returns %TRUE, you should use
    # g_cancellable_release_fd() to free up resources allocated for the
    # @pollfd. After a %FALSE return, do not call g_cancellable_release_fd().
    #
    # If this function returns %FALSE, either no @cancellable was given or
    # resource limits prevent this function from allocating the necessary
    # structures for polling. (On Linux, you will likely have reached
    # the maximum number of file descriptors.) The suggested way to handle
    # these cases is to ignore the @cancellable.
    #
    # You are not supposed to read from the fd yourself, just check for
    # readable status. Reading to unset the readable status is done
    # with g_cancellable_reset().
    def make_pollfd(pollfd : GLib::PollFD) : Bool
      # g_cancellable_make_pollfd: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_cancellable_make_pollfd(self, pollfd)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Pops @cancellable off the cancellable stack (verifying that @cancellable
    # is on the top of the stack).
    def pop_current : Nil
      # g_cancellable_pop_current: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_pop_current(self)

      # Return value handling
    end

    # Pushes @cancellable onto the cancellable stack. The current
    # cancellable can then be received using g_cancellable_get_current().
    #
    # This is useful when implementing cancellable operations in
    # code that does not allow you to pass down the cancellable object.
    #
    # This is typically called automatically by e.g. #GFile operations,
    # so you rarely have to call this yourself.
    def push_current : Nil
      # g_cancellable_push_current: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_push_current(self)

      # Return value handling
    end

    # Releases a resources previously allocated by g_cancellable_get_fd()
    # or g_cancellable_make_pollfd().
    #
    # For compatibility reasons with older releases, calling this function
    # is not strictly required, the resources will be automatically freed
    # when the @cancellable is finalized. However, the @cancellable will
    # block scarce file descriptors until it is finalized if this function
    # is not called. This can cause the application to run out of file
    # descriptors when many #GCancellables are used at the same time.
    def release_fd : Nil
      # g_cancellable_release_fd: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_release_fd(self)

      # Return value handling
    end

    # Resets @cancellable to its uncancelled state.
    #
    # If cancellable is currently in use by any cancellable operation
    # then the behavior of this function is undefined.
    #
    # Note that it is generally not a good idea to reuse an existing
    # cancellable for more operations after it has been cancelled once,
    # as this function might tempt you to do. The recommended practice
    # is to drop the reference to a cancellable after cancelling it,
    # and let it die with the outstanding async operations. You should
    # create a fresh cancellable for further async operations.
    def reset : Nil
      # g_cancellable_reset: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_cancellable_reset(self)

      # Return value handling
    end

    # If the @cancellable is cancelled, sets the error to notify
    # that the operation was cancelled.
    def set_error_if_cancelled : Bool
      # g_cancellable_set_error_if_cancelled: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGio.g_cancellable_set_error_if_cancelled(self, pointerof(_error))

      # Error check
      Gio.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Creates a source that triggers if @cancellable is cancelled and
    # calls its callback of type #GCancellableSourceFunc. This is
    # primarily useful for attaching to another (non-cancellable) source
    # with g_source_add_child_source() to add cancellability to it.
    #
    # For convenience, you can call this with a %NULL #GCancellable,
    # in which case the source will never trigger.
    #
    # The new #GSource will hold a reference to the #GCancellable.
    def source_new : GLib::Source
      # g_cancellable_source_new: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_cancellable_source_new(self)

      # Return value handling

      GLib::Source.new(_retval, GICrystal::Transfer::Full)
    end

    # Emitted when the operation has been cancelled.
    #
    # Can be used by implementations of cancellable operations. If the
    # operation is cancelled from another thread, the signal will be
    # emitted in the thread that cancelled the operation, not the
    # thread that is running the operation.
    #
    # Note that disconnecting from this signal (or any signal) in a
    # multi-threaded program is prone to race conditions. For instance
    # it is possible that a signal handler may be invoked even after
    # a call to g_signal_handler_disconnect() for that handler has
    # already returned.
    #
    # There is also a problem when cancellation happens right before
    # connecting to the signal. If this happens the signal will
    # unexpectedly not be emitted, and checking before connecting to
    # the signal leaves a race condition where this is still happening.
    #
    # In order to make it safe and easy to connect handlers there
    # are two helper functions: g_cancellable_connect() and
    # g_cancellable_disconnect() which protect against problems
    # like this.
    #
    # An example of how to us this:
    # |[<!-- language="C" -->
    #     // Make sure we don't do unnecessary work if already cancelled
    #     if (g_cancellable_set_error_if_cancelled (cancellable, error))
    #       return;
    #
    #     // Set up all the data needed to be able to handle cancellation
    #     // of the operation
    #     my_data = my_data_new (...);
    #
    #     id = 0;
    #     if (cancellable)
    #       id = g_cancellable_connect (cancellable,
    #     			      G_CALLBACK (cancelled_handler)
    #     			      data, NULL);
    #
    #     // cancellable operation here...
    #
    #     g_cancellable_disconnect (cancellable, id);
    #
    #     // cancelled_handler is never called after this, it is now safe
    #     // to free the data
    #     my_data_free (my_data);
    # ]|
    #
    # Note that the cancelled signal is emitted in the thread that
    # the user cancelled from, which may be the main thread. So, the
    # cancellable signal should not do something that can block.
    struct CancelledSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cancelled::#{@detail}" : "cancelled"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gio::Cancellable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Cancellable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Cancellable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gio::Cancellable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gio::Cancellable.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gio::Cancellable, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "cancelled")
      end
    end

    def cancelled_signal
      CancelledSignal.new(self)
    end
  end
end
