import { useEffect, useState } from "react";
import {
  CircularProgress,
  Backdrop,
  Button,
  Paper,
  TableContainer,
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
  TablePagination,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  TextField,
  Grid,
  IconButton,
  Tooltip,
} from "@mui/material";
import useMediaQuery from "@mui/material/useMediaQuery";
import { useTheme, styled } from "@mui/material/styles";
import LoadingButton from "@mui/lab/LoadingButton/LoadingButton";
import EditIcon from "@mui/icons-material/Edit";
import Swal from "sweetalert2";
import Axios from "axios";
import Image from "mui-image";
import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";
import PrintIcon from "@mui/icons-material/Print";

function Product() {
  const theme = useTheme();
  const [isLoading, setIsLoading] = useState(true);
  const [products, setProducts] = useState([]);
  const [isBtnLoading, setIsBtnLoading] = useState(false);

  const [price, setPrice] = useState(0);

  // Uploading image url
  const [uploadFile, setUploadFile] = useState("");

  //Dialog
  const modalWidth = useMediaQuery(theme.breakpoints.down("md"));
  const [openModalProduct, setOpenModalProduct] = useState(false);
  const [openModalUpdateProduct, setOpenModalUpdateProduct] = useState(false);

  // data table
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [tableHasNoData, setTableHasNoData] = useState(true);

  // update product
  const [productName, setProductName] = useState("");
  const [prodDescription, setProdDescription] = useState("");
  const [prodPrice, setProdPrice] = useState(0);
  const [prodId, setProdId] = useState(0);
  const [currentImageUrl, setCurrentImageUrl] = useState("");
  const [imageFieldVisibility, setImageFieldVisibility] = useState(false);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const StyledTableRow = styled(TableRow)(({ theme }) => ({
    "&:nth-of-type(odd)": {
      backgroundColor: theme.palette.action.hover,
    },
    // hide last border
    "&:last-child td, &:last-child th": {
      border: 0,
    },
  }));

  useEffect(() => {
    const timer = setTimeout(() => {
      fetch("https://gymerls-staging-server.vercel.app/api/get-product", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          added_by: localStorage.getItem("username"),
        }),
      })
        .then((response) => response.json())
        .then((data) => {
          setProducts(data);
          setFilteredList(data);
          if (data.length === 0) {
            setTableHasNoData(true);
          } else {
            setTableHasNoData(false);
          }
          setIsLoading(false);
        });
    }, 1000);
    return () => clearTimeout(timer);
  }, []);

  const formatDate = (date) => {
    var dateToFormat = new Date(date);
    var year = dateToFormat.toLocaleString("default", { year: "numeric" });
    var month = dateToFormat.toLocaleString("default", { month: "2-digit" });
    var day = dateToFormat.toLocaleString("default", { day: "2-digit" });

    var formattedDate = year + "-" + month + "-" + day;
    return formattedDate;
  };

  const handleOpenModalProduct = (e) => {
    e.preventDefault();
    setOpenModalProduct(true);
    setIsBtnLoading(false);
  };

  const handleCloseModalProduct = (e) => {
    e.preventDefault();
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        setOpenModalProduct(false);
      }
    });
  };

  const uploadImageToCloud = (callback) => {
    // IMAGE
    const formData = new FormData();
    formData.append("file", uploadFile);
    formData.append("upload_preset", "React-cloudinary");

    Axios.post(
      "https://api.cloudinary.com/v1_1/dpruj7bhk/image/upload",
      formData
    )
      .then((response) => {
        callback(response.data.secure_url);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const createProduct = (e) => {
    e.preventDefault();
    setIsBtnLoading(true);
    const data = new FormData(e.currentTarget);
    const addedDate = formatDate(new Date());
    const product_name = data.get("product_name");
    uploadImageToCloud(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/create-product", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          product_name: data.get("product_name"),
          image_url: callback,
          description: data.get("description"),
          price: data.get("price"),
          added_by: localStorage.getItem("username"),
          added_date: addedDate,
        }),
      })
        .then((res) => res.json())
        .then((result) => {
          userLog(
            localStorage.getItem("username"),
            "Create",
            "new product",
            product_name
          );

          Swal.fire({
            title: "Product successfully created!",
            icon: "success",
            showConfirmButton: false,
            timer: 1500,
          }).then(function () {
            setOpenModalProduct(false);
            setIsBtnLoading(false);
            setIsLoading(true);
            window.location.reload(false);
          });
        });
    });
  };

  const updateProduct = (e) => {
    e.preventDefault();
    setIsBtnLoading(true);
    const data = new FormData(e.currentTarget);
    const product_name = data.get("update_prod_name");

    uploadImageToCloud(function (callback) {
      Swal.fire({
        icon: "info",
        title: "Are you sure you want to update this product?",
        text: "You won't be able to revert this!",
        showCancelButton: true,
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        allowOutsideClick: false,
      }).then((result) => {
        if (result.isConfirmed) {
          fetch(
            "https://gymerls-staging-server.vercel.app/api/update-product",
            {
              method: "PATCH",
              headers: {
                "Content-type": "application/json",
              },
              body: JSON.stringify({
                product_name: data.get("update_prod_name"),
                image_url: callback,
                description: data.get("update_description"),
                price: data.get("update_price"),
                id: prodId,
              }),
            }
          )
            .then((res) => res.json())
            .then((result) => {
              userLog(
                localStorage.getItem("username"),
                "Update",
                "product",
                product_name
              );
              Swal.fire({
                title: "Product successfully updated!",
                icon: "success",
                showConfirmButton: false,
                timer: 1500,
              }).then(function () {
                setIsBtnLoading(false);
                setOpenModalUpdateProduct(false);
                window.location.reload(false);
              });
            });
        } else {
          setIsBtnLoading(false);
        }
      });
      setIsBtnLoading(false);
    });
  };

  const handleCloseUpdateProduct = (e) => {
    e.preventDefault();
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        setOpenModalUpdateProduct(false);
      }
    });
  };

  const handleOpenUpdateProduct = (id) => {
    setOpenModalUpdateProduct(true);
    setIsBtnLoading(false);
    setProdId(id);
    setImageFieldVisibility(false);

    fetch("https://gymerls-staging-server.vercel.app/api/get-product-by-id", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        id: id,
      }),
    })
      .then((res) => res.json())
      .then((result) => {
        setProductName(result[0].product_name);
        setCurrentImageUrl(result[0].image_url);
        setProdDescription(result[0].description);
        setProdPrice(result[0].price);
        // set the image url
        setUploadFile(result[0].image_url);
      });
  };

  const [filteredList, setFilteredList] = new useState(products);

  const filterBySearch = (e) => {
    const results = products.filter((prod) => {
      if (e.target.value === "") return products;
      return prod.product_name
        .toLowerCase()
        .includes(e.target.value.toLowerCase());
    });
    setFilteredList(results);
  };

  const getIpAddress = (callback) => {
    fetch("https://api.ipify.org?format=json")
      .then((response) => response.json())
      .then((data) => callback(data.ip))
      .catch((error) => console.log(error));
  };

  const userLog = (author, action, event, product) => {
    getIpAddress(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/insert-log", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: author,
          event_info: `${action} - ${event} "${product}"`,
          ip_address: callback,
          platform: window.navigator.userAgentData.platform,
        }),
      }).catch((error) => console.log(error));
    });
  };

  const downloadPdf = () => {
    const doc = new jsPDF();
    doc.text("List of product", 20, 10);
    doc.autoTable({ html: "#productsTable" });
    doc.save("products.pdf");
  };

  return (
    <>
      {isLoading ? (
        <div>
          <Backdrop
            sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
            open={true}
          >
            <CircularProgress color="inherit" />
          </Backdrop>
        </div>
      ) : (
        <div>
          {/* UPDATE PRODUCT */}
          <Dialog
            fullScreen={modalWidth}
            open={openModalUpdateProduct}
            aria-labelledby="responsive-dialog-title"
          >
            <form onSubmit={updateProduct}>
              <DialogTitle id="responsive-dialog-title">
                UPDATE PRODUCT
              </DialogTitle>
              <DialogContent>
                <DialogContentText>Fill up all fields</DialogContentText>
                <div>
                  <TextField
                    name="update_prod_name"
                    label="Name"
                    margin="dense"
                    value={productName}
                    fullWidth
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      setProductName(e.target.value);
                    }}
                    required
                  />
                  <Grid container sx={{ marginBottom: 1 }}>
                    <Grid item xs={6}>
                      <Image
                        src={currentImageUrl}
                        alt="empty cart"
                        height={150}
                        width={150}
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <Tooltip title="Edit photo">
                        <IconButton
                          onClick={() => {
                            setImageFieldVisibility(true);
                          }}
                        >
                          <EditIcon />
                        </IconButton>
                      </Tooltip>
                    </Grid>
                  </Grid>

                  {imageFieldVisibility ? (
                    <TextField
                      name="image_url"
                      margin="dense"
                      fullWidth
                      sx={{ marginBottom: "1rem" }}
                      type="file"
                      onChange={(event) => {
                        setUploadFile(event.target.files[0]);
                      }}
                    />
                  ) : (
                    ""
                  )}

                  <TextField
                    name="update_description"
                    label="Description"
                    margin="dense"
                    fullWidth
                    value={prodDescription}
                    multiline
                    rows={2}
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      setProdDescription(e.target.value);
                    }}
                    required
                  />
                  <TextField
                    name="update_price"
                    label="Price"
                    margin="dense"
                    value={prodPrice}
                    fullWidth
                    type="number"
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      const amount = e.target.value;

                      if (!amount || amount.match(/^\d{1,}(\.\d{0,4})?$/)) {
                        setProdPrice(amount);
                      }
                    }}
                    required
                  />
                </div>
              </DialogContent>
              <DialogActions>
                <Button
                  variant="contained"
                  color="error"
                  onClick={handleCloseUpdateProduct}
                >
                  CANCEL
                </Button>
                <LoadingButton
                  variant="contained"
                  loading={isBtnLoading}
                  type="submit"
                >
                  <span>UPDATE</span>
                </LoadingButton>
              </DialogActions>
            </form>
          </Dialog>

          {/* PRODUCT */}
          <Dialog
            fullScreen={modalWidth}
            open={openModalProduct}
            aria-labelledby="responsive-dialog-title"
          >
            <form onSubmit={createProduct}>
              <DialogTitle id="responsive-dialog-title">
                CREATE NEW PRODUCT
              </DialogTitle>
              <DialogContent>
                <DialogContentText>Fill up all fields</DialogContentText>
                <div>
                  <TextField
                    name="product_name"
                    label="Name"
                    margin="dense"
                    fullWidth
                    sx={{ marginBottom: "1rem" }}
                    required
                  />
                  <TextField
                    name="image_url"
                    margin="dense"
                    fullWidth
                    sx={{ marginBottom: "1rem" }}
                    type="file"
                    onChange={(event) => {
                      setUploadFile(event.target.files[0]);
                    }}
                    required
                  />
                  <TextField
                    name="description"
                    label="Description"
                    margin="dense"
                    fullWidth
                    multiline
                    rows={2}
                    sx={{ marginBottom: "1rem" }}
                    required
                  />
                  <TextField
                    name="price"
                    label="Price"
                    margin="dense"
                    value={price}
                    fullWidth
                    type="number"
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      const amount = e.target.value;

                      if (!amount || amount.match(/^\d{1,}(\.\d{0,4})?$/)) {
                        setPrice(amount);
                      }
                    }}
                    required
                  />
                </div>
              </DialogContent>
              <DialogActions>
                <Button
                  variant="contained"
                  color="error"
                  onClick={handleCloseModalProduct}
                >
                  CANCEL
                </Button>
                <LoadingButton
                  variant="contained"
                  loading={isBtnLoading}
                  type="submit"
                >
                  <span>CREATE</span>
                </LoadingButton>
              </DialogActions>
            </form>
          </Dialog>

          <Grid container>
            <Grid item xs={7}>
              <Button variant="outlined" onClick={handleOpenModalProduct}>
                Create new product
              </Button>
            </Grid>
            <Grid item xs={5} display={"flex"} gap={1}>
              <TextField
                label="Search product name"
                onChange={filterBySearch}
                fullWidth
              />
            </Grid>
            <Grid item xs={12} display={"flex"}>
              <Grid>
                <Button onClick={() => downloadPdf()} startIcon={<PrintIcon />}>
                  Export as PDF
                </Button>
              </Grid>
            </Grid>
          </Grid>

          <Paper sx={{ width: "100%", overflow: "hidden" }} elevation={3}>
            <TableContainer sx={{ maxHeight: 700 }}>
              <Table stickyHeader aria-label="sticky table">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>IMAGE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>PRICE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      ADDED DATE
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ACTIONS
                    </TableCell>
                  </TableRow>
                </TableHead>
                {tableHasNoData ? (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={6}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                ) : (
                  <TableBody>
                    {filteredList
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((prod) => {
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={prod.id}
                          >
                            <TableCell>
                              <Image
                                src={prod.image_url}
                                alt="image.jpg"
                                height={50}
                                width={50}
                              />
                            </TableCell>
                            <TableCell>{prod.product_name}</TableCell>
                            <TableCell>{prod.description}</TableCell>
                            <TableCell>{"₱" + prod.price}</TableCell>
                            <TableCell>{formatDate(prod.added_date)}</TableCell>
                            <TableCell align="center">
                              <Button
                                variant="text"
                                color="success"
                                sx={{ marginRight: ".5rem" }}
                                onClick={() => handleOpenUpdateProduct(prod.id)}
                              >
                                Update
                              </Button>
                            </TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                )}
              </Table>
            </TableContainer>
            <TablePagination
              rowsPerPageOptions={[10, 15, 20]}
              component="div"
              count={filteredList.length}
              rowsPerPage={rowsPerPage}
              page={page}
              onPageChange={handleChangePage}
              onRowsPerPageChange={handleChangeRowsPerPage}
            />

            {/* PDF */}
            <TableContainer sx={{ maxHeight: 700, display: "none" }}>
              <Table stickyHeader aria-label="sticky table" id="productsTable">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>PRICE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      ADDED DATE
                    </TableCell>
                  </TableRow>
                </TableHead>
                {tableHasNoData ? (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={4}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                ) : (
                  <TableBody>
                    {filteredList
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((prod) => {
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={prod.id}
                          >
                            <TableCell>{prod.product_name}</TableCell>
                            <TableCell>{prod.description}</TableCell>
                            <TableCell>{"₱" + prod.price}</TableCell>
                            <TableCell>{formatDate(prod.added_date)}</TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                )}
              </Table>
            </TableContainer>
          </Paper>
        </div>
      )}
    </>
  );
}

export default Product;
