module GLib
  # A simple refcounted data type representing an immutable sequence of zero or
  # more bytes from an unspecified origin.
  #
  # The purpose of a #GBytes is to keep the memory region that it holds
  # alive for as long as anyone holds a reference to the bytes.  When
  # the last reference count is dropped, the memory is released. Multiple
  # unrelated callers can use byte data in the #GBytes without coordinating
  # their activities, resting assured that the byte data will not change or
  # move while they hold a reference.
  #
  # A #GBytes can come from many different origins that may have
  # different procedures for freeing the memory region.  Examples are
  # memory from g_malloc(), from memory slices, from a #GMappedFile or
  # memory from other allocators.
  #
  # #GBytes work well as keys in #GHashTable. Use g_bytes_equal() and
  # g_bytes_hash() as parameters to g_hash_table_new() or g_hash_table_new_full().
  # #GBytes can also be used as keys in a #GTree by passing the g_bytes_compare()
  # function to g_tree_new().
  #
  # The data pointed to by this bytes must not be modified. For a mutable
  # array of bytes see #GByteArray. Use g_bytes_unref_to_array() to create a
  # mutable array for a #GBytes sequence. To create an immutable #GBytes from
  # a mutable #GByteArray, use the g_byte_array_free_to_bytes() function.
  class Bytes
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(Bytes.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(Bytes.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::Bytes)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_bytes_get_type
    end

    def initialize(data : Enumerable(UInt8)?)
      # g_bytes_new: (Constructor)
      # @data: (nullable) (array length=size element-type UInt8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      size = data.try(&.size) || 0
      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(UInt8).null
             else
               data.to_a.to_unsafe
             end

      # C call
      _retval = LibGLib.g_bytes_new(data, size)

      # Return value handling

      @pointer = _retval
    end

    def initialize(*data : UInt8)
      initialize(data)
    end

    def self.new_take(data : Enumerable(UInt8)?) : self
      # g_bytes_new_take: (Constructor)
      # @data: (transfer full) (nullable) (array length=size element-type UInt8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      size = data.try(&.size) || 0
      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(UInt8).null
             else
               data.to_a.to_unsafe
             end

      # C call
      _retval = LibGLib.g_bytes_new_take(data, size)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_take(*data : UInt8)
      self.new_take(data)
    end

    def compare(bytes2 : GLib::Bytes) : Int32
      # g_bytes_compare: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_bytes_compare(self, bytes2)

      # Return value handling

      _retval
    end

    def equal(bytes2 : GLib::Bytes) : Bool
      # g_bytes_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_bytes_equal(self, bytes2)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def data : Enumerable(UInt8)?
      # g_bytes_get_data: (Method)
      # @size: (out) (transfer full) (optional)
      # Returns: (transfer none) (array length=size element-type UInt8)

      # Generator::OutArgUsedInReturnPlan
      size = 0_u64

      # C call
      _retval = LibGLib.g_bytes_get_data(self, pointerof(size))

      # Return value handling

      GICrystal.transfer_array(_retval, size, GICrystal::Transfer::None) unless _retval.null?
    end

    def region(element_size : UInt64, offset : UInt64, n_elements : UInt64) : Pointer(Void)?
      # g_bytes_get_region: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_bytes_get_region(self, element_size, offset, n_elements)

      # Return value handling

      _retval unless _retval.null?
    end

    def size : UInt64
      # g_bytes_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_bytes_get_size(self)

      # Return value handling

      _retval
    end

    def hash : UInt32
      # g_bytes_hash: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_bytes_hash(self)

      # Return value handling

      _retval
    end

    def new_from_bytes(offset : UInt64, length : UInt64) : GLib::Bytes
      # g_bytes_new_from_bytes: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_bytes_new_from_bytes(self, offset, length)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def ref : GLib::Bytes
      # g_bytes_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_bytes_ref(self)

      # Return value handling

      GLib::Bytes.new(_retval, GICrystal::Transfer::Full)
    end

    def to_unsafe
      @pointer
    end
  end
end
