require "../g_object-2.0/object"
require "./buildable"

require "./cell_layout"

module Gtk
  # `GtkEntryCompletion` is an auxiliary object to provide completion functionality
  # for `GtkEntry`.
  #
  # It implements the `Gtk#CellLayout` interface, to allow the user
  # to add extra cells to the `GtkTreeView` with completion matches.
  #
  # “Completion functionality” means that when the user modifies the text
  # in the entry, `GtkEntryCompletion` checks which rows in the model match
  # the current content of the entry, and displays a list of matches.
  # By default, the matching is done by comparing the entry text
  # case-insensitively against the text column of the model (see
  # `Gtk::EntryCompletion#text_column=`), but this can be overridden
  # with a custom match function (see `Gtk::EntryCompletion#match_func=`).
  #
  # When the user selects a completion, the content of the entry is
  # updated. By default, the content of the entry is replaced by the
  # text column of the model, but this can be overridden by connecting
  # to the [signal@Gtk.EntryCompletion::match-selected] signal and updating the
  # entry in the signal handler. Note that you should return %TRUE from
  # the signal handler to suppress the default behaviour.
  #
  # To add completion functionality to an entry, use
  # `Gtk::Entry#completion=`.
  #
  # `GtkEntryCompletion` uses a `Gtk#TreeModelFilter` model to
  # represent the subset of the entire model that is currently matching.
  # While the `GtkEntryCompletion` signals
  # [signal@Gtk.EntryCompletion::match-selected] and
  # [signal@Gtk.EntryCompletion::cursor-on-match] take the original model
  # and an iter pointing to that model as arguments, other callbacks and
  # signals (such as `GtkCellLayoutDataFunc` or
  # [signal@Gtk.CellArea::apply-attributes)]
  # will generally take the filter model as argument. As long as you are
  # only calling `Gtk::TreeModel#get`, this will make no difference to
  # you. If for some reason, you need the original model, use
  # `Gtk::TreeModelFilter#model`. Don’t forget to use
  # `Gtk::TreeModelFilter#convert_iter_to_child_iter` to obtain a
  # matching iter.
  @[GObject::GeneratedWrapper]
  class EntryCompletion < GObject::Object
    include Buildable
    include CellLayout

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::EntryCompletion), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, cell_area : Gtk::CellArea? = nil, inline_completion : Bool? = nil, inline_selection : Bool? = nil, minimum_key_length : Int32? = nil, model : Gtk::TreeModel? = nil, popup_completion : Bool? = nil, popup_set_width : Bool? = nil, popup_single_match : Bool? = nil, text_column : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[9]
      _values = StaticArray(LibGObject::Value, 9).new(LibGObject::Value.new)
      _n = 0

      if !cell_area.nil?
        (_names.to_unsafe + _n).value = "cell-area".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cell_area)
        _n += 1
      end
      if !inline_completion.nil?
        (_names.to_unsafe + _n).value = "inline-completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inline_completion)
        _n += 1
      end
      if !inline_selection.nil?
        (_names.to_unsafe + _n).value = "inline-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inline_selection)
        _n += 1
      end
      if !minimum_key_length.nil?
        (_names.to_unsafe + _n).value = "minimum-key-length".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, minimum_key_length)
        _n += 1
      end
      if !model.nil?
        (_names.to_unsafe + _n).value = "model".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, model)
        _n += 1
      end
      if !popup_completion.nil?
        (_names.to_unsafe + _n).value = "popup-completion".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_completion)
        _n += 1
      end
      if !popup_set_width.nil?
        (_names.to_unsafe + _n).value = "popup-set-width".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_set_width)
        _n += 1
      end
      if !popup_single_match.nil?
        (_names.to_unsafe + _n).value = "popup-single-match".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, popup_single_match)
        _n += 1
      end
      if !text_column.nil?
        (_names.to_unsafe + _n).value = "text-column".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text_column)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(EntryCompletion.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_entry_completion_get_type
    end

    def cell_area=(value : Gtk::CellArea?) : Gtk::CellArea?
      unsafe_value = value

      LibGObject.g_object_set(self, "cell-area", unsafe_value, Pointer(Void).null)
      value
    end

    def cell_area : Gtk::CellArea?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "cell-area", pointerof(value), Pointer(Void).null)
      Gtk::CellArea.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def inline_completion=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inline-completion", unsafe_value, Pointer(Void).null)
      value
    end

    def inline_completion? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inline-completion", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def inline_selection=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "inline-selection", unsafe_value, Pointer(Void).null)
      value
    end

    def inline_selection? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "inline-selection", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def minimum_key_length=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "minimum-key-length", unsafe_value, Pointer(Void).null)
      value
    end

    def minimum_key_length : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "minimum-key-length", pointerof(value), Pointer(Void).null)
      value
    end

    def model=(value : Gtk::TreeModel?) : Gtk::TreeModel?
      unsafe_value = value

      LibGObject.g_object_set(self, "model", unsafe_value, Pointer(Void).null)
      value
    end

    def model : Gtk::TreeModel?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "model", pointerof(value), Pointer(Void).null)
      Gtk::TreeModel__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def popup_completion=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "popup-completion", unsafe_value, Pointer(Void).null)
      value
    end

    def popup_completion? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "popup-completion", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def popup_set_width=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "popup-set-width", unsafe_value, Pointer(Void).null)
      value
    end

    def popup_set_width? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "popup-set-width", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def popup_single_match=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "popup-single-match", unsafe_value, Pointer(Void).null)
      value
    end

    def popup_single_match? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "popup-single-match", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def text_column=(value : Int32) : Int32
      unsafe_value = value

      LibGObject.g_object_set(self, "text-column", unsafe_value, Pointer(Void).null)
      value
    end

    def text_column : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "text-column", pointerof(value), Pointer(Void).null)
      value
    end

    # Creates a new `GtkEntryCompletion` object.
    def initialize
      # gtk_entry_completion_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_entry_completion_new

      # Return value handling

      @pointer = _retval
    end

    # Creates a new `GtkEntryCompletion` object using the
    # specified @area.
    #
    # The `GtkCellArea` is used to layout cells in the underlying
    # `GtkTreeViewColumn` for the drop-down menu.
    def self.new_with_area(area : Gtk::CellArea) : self
      # gtk_entry_completion_new_with_area: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_entry_completion_new_with_area(area)

      # Return value handling

      Gtk::EntryCompletion.new(_retval, GICrystal::Transfer::Full)
    end

    # Requests a completion operation, or in other words a refiltering of the
    # current list with completions, using the current key.
    #
    # The completion list view will be updated accordingly.
    def complete : Nil
      # gtk_entry_completion_complete: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_complete(self)

      # Return value handling
    end

    # Computes the common prefix that is shared by all rows in @completion
    # that start with @key.
    #
    # If no row matches @key, %NULL will be returned.
    # Note that a text column must have been set for this function to work,
    # see `Gtk::EntryCompletion#text_column=` for details.
    def compute_prefix(key : ::String) : ::String?
      # gtk_entry_completion_compute_prefix: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_entry_completion_compute_prefix(self, key)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    # Get the original text entered by the user that triggered
    # the completion or %NULL if there’s no completion ongoing.
    def completion_prefix : ::String?
      # gtk_entry_completion_get_completion_prefix: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_completion_prefix(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the entry @completion has been attached to.
    def entry : Gtk::Widget
      # gtk_entry_completion_get_entry: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_entry(self)

      # Return value handling

      Gtk::Widget.new(_retval, GICrystal::Transfer::None)
    end

    # Returns whether the common prefix of the possible completions should
    # be automatically inserted in the entry.
    def inline_completion : Bool
      # gtk_entry_completion_get_inline_completion: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_inline_completion(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns %TRUE if inline-selection mode is turned on.
    def inline_selection : Bool
      # gtk_entry_completion_get_inline_selection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_inline_selection(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the minimum key length as set for @completion.
    def minimum_key_length : Int32
      # gtk_entry_completion_get_minimum_key_length: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_minimum_key_length(self)

      # Return value handling

      _retval
    end

    # Returns the model the `GtkEntryCompletion` is using as data source.
    #
    # Returns %NULL if the model is unset.
    def model : Gtk::TreeModel?
      # gtk_entry_completion_get_model: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_model(self)

      # Return value handling

      Gtk::TreeModel__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the completions should be presented in a popup window.
    def popup_completion : Bool
      # gtk_entry_completion_get_popup_completion: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_popup_completion(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the completion popup window will be resized to the
    # width of the entry.
    def popup_set_width : Bool
      # gtk_entry_completion_get_popup_set_width: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_popup_set_width(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the completion popup window will appear even if there is
    # only a single match.
    def popup_single_match : Bool
      # gtk_entry_completion_get_popup_single_match: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_popup_single_match(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the column in the model of @completion to get strings from.
    def text_column : Int32
      # gtk_entry_completion_get_text_column: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_entry_completion_get_text_column(self)

      # Return value handling

      _retval
    end

    # Requests a prefix insertion.
    def insert_prefix : Nil
      # gtk_entry_completion_insert_prefix: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_insert_prefix(self)

      # Return value handling
    end

    # Sets whether the common prefix of the possible completions should
    # be automatically inserted in the entry.
    def inline_completion=(inline_completion : Bool) : Nil
      # gtk_entry_completion_set_inline_completion: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_inline_completion(self, inline_completion)

      # Return value handling
    end

    # Sets whether it is possible to cycle through the possible completions
    # inside the entry.
    def inline_selection=(inline_selection : Bool) : Nil
      # gtk_entry_completion_set_inline_selection: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_inline_selection(self, inline_selection)

      # Return value handling
    end

    # Sets the match function for @completion to be @func.
    #
    # The match function is used to determine if a row should or
    # should not be in the completion list.
    def set_match_func(func : Pointer(Void), func_data : Pointer(Void)?, func_notify : Pointer(Void)) : Nil
      # gtk_entry_completion_set_match_func: (Method)
      # @func_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      func_data = if func_data.nil?
                    Pointer(Void).null
                  else
                    func_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_entry_completion_set_match_func(self, func, func_data, func_notify)

      # Return value handling
    end

    # Requires the length of the search key for @completion to be at least
    # @length.
    #
    # This is useful for long lists, where completing using a small
    # key takes a lot of time and will come up with meaningless results anyway
    # (ie, a too large dataset).
    def minimum_key_length=(length : Int32) : Nil
      # gtk_entry_completion_set_minimum_key_length: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_minimum_key_length(self, length)

      # Return value handling
    end

    # Sets the model for a `GtkEntryCompletion`.
    #
    # If @completion already has a model set, it will remove it
    # before setting the new model. If model is %NULL, then it
    # will unset the model.
    def model=(model : Gtk::TreeModel?) : Nil
      # gtk_entry_completion_set_model: (Method | Setter)
      # @model: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      model = if model.nil?
                Pointer(Void).null
              else
                model.to_unsafe
              end

      # C call
      LibGtk.gtk_entry_completion_set_model(self, model)

      # Return value handling
    end

    # Sets whether the completions should be presented in a popup window.
    def popup_completion=(popup_completion : Bool) : Nil
      # gtk_entry_completion_set_popup_completion: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_popup_completion(self, popup_completion)

      # Return value handling
    end

    # Sets whether the completion popup window will be resized to be the same
    # width as the entry.
    def popup_set_width=(popup_set_width : Bool) : Nil
      # gtk_entry_completion_set_popup_set_width: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_popup_set_width(self, popup_set_width)

      # Return value handling
    end

    # Sets whether the completion popup window will appear even if there is
    # only a single match.
    #
    # You may want to set this to %FALSE if you
    # are using [property@Gtk.EntryCompletion:inline-completion].
    def popup_single_match=(popup_single_match : Bool) : Nil
      # gtk_entry_completion_set_popup_single_match: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_popup_single_match(self, popup_single_match)

      # Return value handling
    end

    # Convenience function for setting up the most used case of this code: a
    # completion list with just strings.
    #
    # This function will set up @completion
    # to have a list displaying all (and just) strings in the completion list,
    # and to get those strings from @column in the model of @completion.
    #
    # This functions creates and adds a `GtkCellRendererText` for the selected
    # column. If you need to set the text column, but don't want the cell
    # renderer, use g_object_set() to set the
    # [property@Gtk.EntryCompletion:text-column] property directly.
    def text_column=(column : Int32) : Nil
      # gtk_entry_completion_set_text_column: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_entry_completion_set_text_column(self, column)

      # Return value handling
    end

    # Emitted when a match from the cursor is on a match of the list.
    #
    # The default behaviour is to replace the contents
    # of the entry with the contents of the text column in the row
    # pointed to by @iter.
    #
    # Note that @model is the model that was passed to
    # `Gtk::EntryCompletion#model=`.
    struct CursorOnMatchSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "cursor-on-match::#{@detail}" : "cursor-on-match"
      end

      def connect(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(model : Gtk::TreeModel, iter : Gtk::TreeIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "cursor-on-match", model, iter)
      end
    end

    def cursor_on_match_signal
      CursorOnMatchSignal.new(self)
    end

    # Emitted when the inline autocompletion is triggered.
    #
    # The default behaviour is to make the entry display the
    # whole prefix and select the newly inserted part.
    #
    # Applications may connect to this signal in order to insert only a
    # smaller part of the @prefix into the entry - e.g. the entry used in
    # the `GtkFileChooser` inserts only the part of the prefix up to the
    # next '/'.
    struct InsertPrefixSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-prefix::#{@detail}" : "insert-prefix"
      end

      def connect(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Bool))
        connect(block)
      end

      def connect(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          _retval = ::Box(Proc(::String, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          arg0 = ::String.new(lib_arg0)
          _retval = ::Box(Proc(::String, Bool)).unbox(box).call(arg0)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryCompletion, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::EntryCompletion, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryCompletion, ::String, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(LibC::Char), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = ::String.new(lib_arg0)
          ::Box(Proc(Gtk::EntryCompletion, ::String, Bool)).unbox(box).call(sender, arg0).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(prefix : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-prefix", prefix)
      end
    end

    def insert_prefix_signal
      InsertPrefixSignal.new(self)
    end

    # Emitted when a match from the list is selected.
    #
    # The default behaviour is to replace the contents of the
    # entry with the contents of the text column in the row
    # pointed to by @iter.
    #
    # Note that @model is the model that was passed to
    # `Gtk::EntryCompletion#model=`.
    struct MatchSelectedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "match-selected::#{@detail}" : "match-selected"
      end

      def connect(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        connect(block)
      end

      def connect(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          _retval = ::Box(Proc(Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(arg0, arg1)
          _retval
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TreeModel__Impl.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TreeIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Gtk::TreeModel, Gtk::TreeIter, Bool)).unbox(box).call(sender, arg0, arg1).to_unsafe
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(model : Gtk::TreeModel, iter : Gtk::TreeIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "match-selected", model, iter)
      end
    end

    def match_selected_signal
      MatchSelectedSignal.new(self)
    end

    # Emitted when the filter model has zero
    # number of rows in completion_complete method.
    #
    # In other words when `GtkEntryCompletion` is out of suggestions.
    struct NoMatchesSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "no-matches::#{@detail}" : "no-matches"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::EntryCompletion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::EntryCompletion, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::EntryCompletion.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::EntryCompletion, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "no-matches")
      end
    end

    def no_matches_signal
      NoMatchesSignal.new(self)
    end
  end
end
