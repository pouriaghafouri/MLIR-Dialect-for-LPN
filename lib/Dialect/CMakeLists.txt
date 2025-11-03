add_mlir_dialect_library(MLIRLPN
  LPNDialect.cpp
  LPNOps.cpp
  
  ADDITIONAL_HEADER_DIRS
  ${PROJECT_SOURCE_DIR}/include/LPN
  
  DEPENDS
  MLIRLPNIncGen
  MLIRLPNPassIncGen
  
  LINK_LIBS PUBLIC
  MLIRIR
)