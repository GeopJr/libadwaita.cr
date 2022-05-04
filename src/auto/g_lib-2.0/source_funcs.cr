module GLib
  # The `GSourceFuncs` struct contains a table of
  # functions used to handle event sources in a generic manner.
  #
  # For idle sources, the prepare and check functions always return %TRUE
  # to indicate that the source is always ready to be processed. The prepare
  # function also returns a timeout value of 0 to ensure that the poll() call
  # doesn't block (since that would be time wasted which could have been spent
  # running the idle function).
  #
  # For timeout sources, the prepare and check functions both return %TRUE
  # if the timeout interval has expired. The prepare function also returns
  # a timeout value to ensure that the poll() call doesn't block too long
  # and miss the next timeout.
  #
  # For file descriptor sources, the prepare function typically returns %FALSE,
  # since it must wait until poll() has been called before it knows whether
  # any events need to be processed. It sets the returned timeout to -1 to
  # indicate that it doesn't mind how long the poll() call blocks. In the
  # check function, it tests the results of the poll() call to see if the
  # required condition has been met, and returns %TRUE if so.
  class SourceFuncs
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGLib::SourceFuncs))
      @pointer.copy_from(pointer, sizeof(LibGLib::SourceFuncs))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(prepare : GLib::Prepare? = nil, check : GLib::Check? = nil, dispatch : Pointer(Void)? = nil, finalize : GLib::Finalize? = nil, closure_callback : GLib::SourceFunc? = nil, closure_marshal : GLib::SourceDummyMarshal? = nil)
      _ptr = Pointer(Void).malloc(48)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.prepare = prepare unless prepare.nil?
      _instance.check = check unless check.nil?
      _instance.dispatch = dispatch unless dispatch.nil?
      _instance.finalize = finalize unless finalize.nil?
      _instance.closure_callback = closure_callback unless closure_callback.nil?
      _instance.closure_marshal = closure_marshal unless closure_marshal.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::SourceFuncs)).zero?
    end

    def prepare : GLib::Prepare
      _var = (@pointer + 0).as(Pointer(Void*))
      GLib::Prepare.new(_var, GICrystal::Transfer::None)
    end

    def prepare=(value : GLib::Prepare)
      _var = (@pointer + 0).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceFuncs))
      value
    end

    def check : GLib::Check
      _var = (@pointer + 8).as(Pointer(Void*))
      GLib::Check.new(_var, GICrystal::Transfer::None)
    end

    def check=(value : GLib::Check)
      _var = (@pointer + 8).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceFuncs))
      value
    end

    def dispatch!
      self.dispatch.not_nil!
    end

    def dispatch : Pointer(Void)?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def dispatch=(value : Pointer(Void)?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def finalize : GLib::Finalize
      _var = (@pointer + 24).as(Pointer(Void*))
      GLib::Finalize.new(_var, GICrystal::Transfer::None)
    end

    def finalize=(value : GLib::Finalize)
      _var = (@pointer + 24).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceFuncs))
      value
    end

    def closure_callback : GLib::SourceFunc
      _var = (@pointer + 32).as(Pointer(Void*))
      GLib::SourceFunc.new(_var, GICrystal::Transfer::None)
    end

    def closure_callback=(value : GLib::SourceFunc)
      _var = (@pointer + 32).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceFuncs))
      value
    end

    def closure_marshal : GLib::SourceDummyMarshal
      _var = (@pointer + 40).as(Pointer(Void*))
      GLib::SourceDummyMarshal.new(_var, GICrystal::Transfer::None)
    end

    def closure_marshal=(value : GLib::SourceDummyMarshal)
      _var = (@pointer + 40).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGLib::SourceFuncs))
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
