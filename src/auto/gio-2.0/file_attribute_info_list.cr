module Gio
  # Acts as a lightweight registry for possible valid file attributes.
  # The registry stores Key-Value pair formats as #GFileAttributeInfos.
  class FileAttributeInfoList
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGio::FileAttributeInfoList))
      @pointer.copy_from(pointer, sizeof(LibGio::FileAttributeInfoList))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(infos : Gio::FileAttributeInfo? = nil, n_infos : Int32? = nil)
      _ptr = Pointer(Void).malloc(16)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.infos = infos unless infos.nil?
      _instance.n_infos = n_infos unless n_infos.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGio::FileAttributeInfoList)).zero?
    end

    def infos!
      self.infos.not_nil!
    end

    def infos : Gio::FileAttributeInfo?
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      Gio::FileAttributeInfo.new(_var.value, GICrystal::Transfer::None)
    end

    def infos=(value : Gio::FileAttributeInfo?)
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def n_infos : Int32
      _var = (@pointer + 8).as(Pointer(Int32))
      _var.value
    end

    def n_infos=(value : Int32)
      _var = (@pointer + 8).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_file_attribute_info_list_get_type
    end

    def add(name : ::String, type : Gio::FileAttributeType, flags : Gio::FileAttributeInfoFlags) : Nil
      # g_file_attribute_info_list_add: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_attribute_info_list_add(@pointer, name, type, flags)

      # Return value handling
    end

    def dup : Gio::FileAttributeInfoList
      # g_file_attribute_info_list_dup: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_attribute_info_list_dup(@pointer)

      # Return value handling

      Gio::FileAttributeInfoList.new(_retval, GICrystal::Transfer::Full)
    end

    def lookup(name : ::String) : Gio::FileAttributeInfo
      # g_file_attribute_info_list_lookup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGio.g_file_attribute_info_list_lookup(@pointer, name)

      # Return value handling

      Gio::FileAttributeInfo.new(_retval, GICrystal::Transfer::None)
    end

    def ref : Gio::FileAttributeInfoList
      # g_file_attribute_info_list_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_file_attribute_info_list_ref(@pointer)

      # Return value handling

      Gio::FileAttributeInfoList.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_file_attribute_info_list_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_file_attribute_info_list_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
