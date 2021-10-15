module Gtk
  # An opaque, stack-allocated struct for iterating
  # over the elements of a `GtkBitset`.
  #
  # Before a `GtkBitsetIter` can be used, it needs to be initialized with
  # [func@Gtk.BitsetIter.init_first], [func@Gtk.BitsetIter.init_last]
  # or [func@Gtk.BitsetIter.init_at].
  class BitsetIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::BitsetIter))
      @pointer.copy_from(pointer, sizeof(LibGtk::BitsetIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(private_data : Enumerable(Pointer(Nil))? = nil)
      _ptr = Pointer(Void).malloc(80)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.private_data = private_data unless private_data.nil?
      _instance
    end

    def finalize
    end

    def private_data : Enumerable(Pointer(Nil))
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)[10]))
      _var.value
    end

    def private_data=(value : Enumerable(Pointer(Nil)))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)[10])).value = value
      value
    end

    def value : UInt32
      # gtk_bitset_iter_get_value: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_iter_get_value(self)
      _retval
    end

    def is_valid : Bool
      # gtk_bitset_iter_is_valid: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_bitset_iter_is_valid(self)
      GICrystal.to_bool(_retval)
    end

    def _next : Bool
      # gtk_bitset_iter_next: (Method)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      value = Pointer(UInt32).null

      _retval = LibGtk.gtk_bitset_iter_next(self, value)
      GICrystal.to_bool(_retval)
    end

    def previous : Bool
      # gtk_bitset_iter_previous: (Method)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      value = Pointer(UInt32).null

      _retval = LibGtk.gtk_bitset_iter_previous(self, value)
      GICrystal.to_bool(_retval)
    end

    def self.init_at(set : Gtk::Bitset, target : UInt32) : Gtk::BitsetIter
      # gtk_bitset_iter_init_at: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      value = Pointer(UInt32).null
      iter = Gtk::BitsetIter.new

      _retval = LibGtk.gtk_bitset_iter_init_at(iter, set, target, value)
      iter
    end

    def self.init_first(set : Gtk::Bitset) : Gtk::BitsetIter
      # gtk_bitset_iter_init_first: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      value = Pointer(UInt32).null
      iter = Gtk::BitsetIter.new

      _retval = LibGtk.gtk_bitset_iter_init_first(iter, set, value)
      iter
    end

    def self.init_last(set : Gtk::Bitset) : Gtk::BitsetIter
      # gtk_bitset_iter_init_last: (None)
      # @iter: (out) (caller-allocates)
      # @value: (out) (transfer full) (optional)
      # Returns: (transfer none)

      value = Pointer(UInt32).null
      iter = Gtk::BitsetIter.new

      _retval = LibGtk.gtk_bitset_iter_init_last(iter, set, value)
      iter
    end

    def to_unsafe
      @pointer
    end
  end
end
