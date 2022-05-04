module GdkPixbuf
  # A `GdkPixbufModule` contains the necessary functions to load and save
  # images in a certain file format.
  #
  # If `GdkPixbuf` has been compiled with `GModule` support, it can be extended
  # by modules which can load (and perhaps also save) new image and animation
  # formats.
  #
  # ## Implementing modules
  #
  # The `GdkPixbuf` interfaces needed for implementing modules are contained in
  # `gdk-pixbuf-io.h` (and `gdk-pixbuf-animation.h` if the module supports
  # animations). They are not covered by the same stability guarantees as the
  # regular GdkPixbuf API. To underline this fact, they are protected by the
  # `GDK_PIXBUF_ENABLE_BACKEND` pre-processor symbol.
  #
  # Each loadable module must contain a `GdkPixbufModuleFillVtableFunc` function
  # named `fill_vtable`, which will get called when the module
  # is loaded and must set the function pointers of the `GdkPixbufModule`.
  #
  # In order to make format-checking work before actually loading the modules
  # (which may require calling `dlopen` to load image libraries), modules export
  # their signatures (and other information) via the `fill_info` function. An
  # external utility, `gdk-pixbuf-query-loaders`, uses this to create a text
  # file containing a list of all available loaders and  their signatures.
  # This file is then read at runtime by `GdkPixbuf` to obtain the list of
  # available loaders and their signatures.
  #
  # Modules may only implement a subset of the functionality available via
  # `GdkPixbufModule`. If a particular functionality is not implemented, the
  # `fill_vtable` function will simply not set the corresponding
  # function pointers of the `GdkPixbufModule` structure. If a module supports
  # incremental loading (i.e. provides `begin_load`, `stop_load` and
  # `load_increment`), it doesn't have to implement `load`, since `GdkPixbuf`
  # can supply a generic `load` implementation wrapping the incremental loading.
  #
  # ## Installing modules
  #
  # Installing a module is a two-step process:
  #
  #  - copy the module file(s) to the loader directory (normally
  #    `$libdir/gdk-pixbuf-2.0/$version/loaders`, unless overridden by the
  #    environment variable `GDK_PIXBUF_MODULEDIR`)
  #  - call `gdk-pixbuf-query-loaders` to update the module file (normally
  #    `$libdir/gdk-pixbuf-2.0/$version/loaders.cache`, unless overridden
  #    by the environment variable `GDK_PIXBUF_MODULE_FILE`)
  class PixbufModule
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGdkPixbuf::PixbufModule))
      @pointer.copy_from(pointer, sizeof(LibGdkPixbuf::PixbufModule))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(module_name : ::String? = nil, module_path : ::String? = nil, module _module : GModule::Module? = nil, info : GdkPixbuf::PixbufFormat? = nil, load : GdkPixbuf::PixbufModuleLoadFunc? = nil, load_xpm_data : GdkPixbuf::PixbufModuleLoadXpmDataFunc? = nil, begin_load : Pointer(Void)? = nil, stop_load : GdkPixbuf::PixbufModuleStopLoadFunc? = nil, load_increment : GdkPixbuf::PixbufModuleIncrementLoadFunc? = nil, load_animation : GdkPixbuf::PixbufModuleLoadAnimationFunc? = nil, save : GdkPixbuf::PixbufModuleSaveFunc? = nil, save_to_callback : Pointer(Void)? = nil, is_save_option_supported : GdkPixbuf::PixbufModuleSaveOptionSupportedFunc? = nil, _reserved1 : Pointer(Void)? = nil, _reserved2 : Pointer(Void)? = nil, _reserved3 : Pointer(Void)? = nil, _reserved4 : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(136)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.module_name = module_name unless module_name.nil?
      _instance.module_path = module_path unless module_path.nil?
      _instance.module = _module unless _module.nil?
      _instance.info = info unless info.nil?
      _instance.load = load unless load.nil?
      _instance.load_xpm_data = load_xpm_data unless load_xpm_data.nil?
      _instance.begin_load = begin_load unless begin_load.nil?
      _instance.stop_load = stop_load unless stop_load.nil?
      _instance.load_increment = load_increment unless load_increment.nil?
      _instance.load_animation = load_animation unless load_animation.nil?
      _instance.save = save unless save.nil?
      _instance.save_to_callback = save_to_callback unless save_to_callback.nil?
      _instance.is_save_option_supported = is_save_option_supported unless is_save_option_supported.nil?
      _instance._reserved1 = _reserved1 unless _reserved1.nil?
      _instance._reserved2 = _reserved2 unless _reserved2.nil?
      _instance._reserved3 = _reserved3 unless _reserved3.nil?
      _instance._reserved4 = _reserved4 unless _reserved4.nil?
      _instance
    end

    def finalize
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule)).zero?
    end

    def module_name!
      self.module_name.not_nil!
    end

    def module_name : ::String?
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def module_name=(value : ::String?)
      _var = (@pointer + 0).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def module_path!
      self.module_path.not_nil!
    end

    def module_path : ::String?
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      return if _var.value.null?
      ::String.new(_var.value)
    end

    def module_path=(value : ::String?)
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value.nil? ? Pointer(LibC::Char).null : value.to_unsafe
      value
    end

    def module!
      self.module.not_nil!
    end

    def module : GModule::Module?
      _var = (@pointer + 16).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GModule::Module.new(_var.value, GICrystal::Transfer::None)
    end

    def module=(value : GModule::Module?)
      _var = (@pointer + 16).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def info!
      self.info.not_nil!
    end

    def info : GdkPixbuf::PixbufFormat?
      _var = (@pointer + 24).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      GdkPixbuf::PixbufFormat.new(_var.value, GICrystal::Transfer::None)
    end

    def info=(value : GdkPixbuf::PixbufFormat?)
      _var = (@pointer + 24).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value.to_unsafe
      value
    end

    def load : GdkPixbuf::PixbufModuleLoadFunc
      _var = (@pointer + 32).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleLoadFunc.new(_var, GICrystal::Transfer::None)
    end

    def load=(value : GdkPixbuf::PixbufModuleLoadFunc)
      _var = (@pointer + 32).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def load_xpm_data : GdkPixbuf::PixbufModuleLoadXpmDataFunc
      _var = (@pointer + 40).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleLoadXpmDataFunc.new(_var, GICrystal::Transfer::None)
    end

    def load_xpm_data=(value : GdkPixbuf::PixbufModuleLoadXpmDataFunc)
      _var = (@pointer + 40).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def begin_load!
      self.begin_load.not_nil!
    end

    def begin_load : Pointer(Void)?
      _var = (@pointer + 48).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def begin_load=(value : Pointer(Void)?)
      _var = (@pointer + 48).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def stop_load : GdkPixbuf::PixbufModuleStopLoadFunc
      _var = (@pointer + 56).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleStopLoadFunc.new(_var, GICrystal::Transfer::None)
    end

    def stop_load=(value : GdkPixbuf::PixbufModuleStopLoadFunc)
      _var = (@pointer + 56).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def load_increment : GdkPixbuf::PixbufModuleIncrementLoadFunc
      _var = (@pointer + 64).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleIncrementLoadFunc.new(_var, GICrystal::Transfer::None)
    end

    def load_increment=(value : GdkPixbuf::PixbufModuleIncrementLoadFunc)
      _var = (@pointer + 64).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def load_animation : GdkPixbuf::PixbufModuleLoadAnimationFunc
      _var = (@pointer + 72).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleLoadAnimationFunc.new(_var, GICrystal::Transfer::None)
    end

    def load_animation=(value : GdkPixbuf::PixbufModuleLoadAnimationFunc)
      _var = (@pointer + 72).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def save : GdkPixbuf::PixbufModuleSaveFunc
      _var = (@pointer + 80).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleSaveFunc.new(_var, GICrystal::Transfer::None)
    end

    def save=(value : GdkPixbuf::PixbufModuleSaveFunc)
      _var = (@pointer + 80).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def save_to_callback!
      self.save_to_callback.not_nil!
    end

    def save_to_callback : Pointer(Void)?
      _var = (@pointer + 88).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def save_to_callback=(value : Pointer(Void)?)
      _var = (@pointer + 88).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def is_save_option_supported : GdkPixbuf::PixbufModuleSaveOptionSupportedFunc
      _var = (@pointer + 96).as(Pointer(Void*))
      GdkPixbuf::PixbufModuleSaveOptionSupportedFunc.new(_var, GICrystal::Transfer::None)
    end

    def is_save_option_supported=(value : GdkPixbuf::PixbufModuleSaveOptionSupportedFunc)
      _var = (@pointer + 96).as(Pointer(Void*))
      _var.copy_from(value.to_unsafe, sizeof(LibGdkPixbuf::PixbufModule))
      value
    end

    def _reserved1!
      self._reserved1.not_nil!
    end

    def _reserved1 : Pointer(Void)?
      _var = (@pointer + 104).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def _reserved1=(value : Pointer(Void)?)
      _var = (@pointer + 104).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def _reserved2!
      self._reserved2.not_nil!
    end

    def _reserved2 : Pointer(Void)?
      _var = (@pointer + 112).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def _reserved2=(value : Pointer(Void)?)
      _var = (@pointer + 112).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def _reserved3!
      self._reserved3.not_nil!
    end

    def _reserved3 : Pointer(Void)?
      _var = (@pointer + 120).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def _reserved3=(value : Pointer(Void)?)
      _var = (@pointer + 120).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def _reserved4!
      self._reserved4.not_nil!
    end

    def _reserved4 : Pointer(Void)?
      _var = (@pointer + 128).as(Pointer(Pointer(Void)))
      return if _var.value.null?
      _var.value
    end

    def _reserved4=(value : Pointer(Void)?)
      _var = (@pointer + 128).as(Pointer(Pointer(Void))).value = value.nil? ? Pointer(Void).null : value
      value
    end

    def to_unsafe
      @pointer
    end
  end
end
