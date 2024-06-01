import { useEffect, useState } from "react";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  TextField,
  Paper,
  TableContainer,
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
  TablePagination,
  Grid,
  Divider,
  CircularProgress,
  Backdrop,
  Switch,
  InputAdornment,
  MenuItem,
} from "@mui/material";
import useMediaQuery from "@mui/material/useMediaQuery";
import { useTheme, styled } from "@mui/material/styles";
import LoadingButton from "@mui/lab/LoadingButton";
import Swal from "sweetalert2";
import jsPDF from "jspdf";
import PrintIcon from "@mui/icons-material/Print";

function Membership() {
  const [open, setOpen] = useState(false);
  const [openModalUpdate, setOpenModalUpdate] = useState(false);

  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const [isLoading, setIsLoading] = useState(true);
  const [isBtnLoading, setIsBtnLoading] = useState(false);

  const [membership, setMembership] = useState("");
  const [price, setPrice] = useState();
  const [countLength, setCountLength] = useState(0);

  // READY MEAL DATA

  const [createReadyMealButtonIsDisabled, setCreateReadyMealButtonIsDisabled] =
    useState(false);

  const [updateMealModal, setUpdateMealModal] = useState(false);
  const [membershipId, setMembershipId] = useState(0);

  const [descriptions, setDescriptions] = useState("");

  // data table
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [subscriptionnoData, setSubscriptionData] = useState(false);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  //CREATE READY MEAL
  const handleReadyMealLogs = (name) => {
    subscriptionLog(
      localStorage.getItem("username"),
      "Created",
      "new ready meal",
      name
    );
  };

  const createMembership = (event) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    const name = data.get("membership");
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(
          "https://gymerls-staging-server.vercel.app/api/create-membership",
          {
            method: "POST",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              name: data.get("membership"),
              description: descriptions,
              price: price,
              status: 1,
              created_by: localStorage.getItem("username"),
            }),
          }
        )
          .then((res) => res.json())
          .then((result) => {
            handleReadyMealLogs(name);
            setOpen(false);
            handleCloseModalMembership();
            window.location.reload(false);
          });
      }
    });
  };

  //DELETE SUBSCRIPTION MEAL
  const deleteMembership = (id, name) => {
    Swal.fire({
      icon: "warning",
      title: "Are you sure you want to delete this subscription?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        subscriptionLog(
          localStorage.getItem("username"),
          "Delete",
          "subscription",
          name
        );

        // DELETE IN READY MEAL
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-membership",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              id: id,
            }),
          }
        ).then((res) => res.json());

        Swal.fire({
          title: "Membership successfully deleted!",
          icon: "success",
          showConfirmButton: false,
          timer: 1500,
        }).then(function () {
          window.location.reload(false);
        });
      } else {
        setIsBtnLoading(false);
      }
    });
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    handleCloseModalMembership();
    setIsLoading(false);
  };

  const handleCloseUpdateMembership = () => {
    setOpenModalUpdate(false);
    setIsLoading(false);
    handleCloseModalMembership();
  };
  const [filteredMembership, setFilteredReadyMeals] = new useState();

  useEffect(() => {
    const timer = setTimeout(() => {
      // getMembershipDataToPopulateTable();
      fetch("https://gymerls-staging-server.vercel.app/api/get-user-by-role", {
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
          if (data === 0) {
          } else {
            setIsLoading(false);
          }
        });

      fetch("https://gymerls-staging-server.vercel.app/api/get-membership")
        .then((response) => response.json())
        .then((data) => {
          if (data.length !== 0) {
            setCountLength(data.length);
            setFilteredReadyMeals(data);
            setSubscriptionData(true);
          } else {
            setSubscriptionData(false);
          }
        });
    }, 1000);
    return () => clearTimeout(timer);
  }, []);

  const getMembershipData = (id) => {
    setMembershipId(id);
    handleClickOpenModalUpdateMeal();
    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-membership-by-id",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          id: id,
        }),
      }
    )
      .then((res) => res.json())
      .then((result) => {
        for (let item of result) {
          setMembership(item.name);
          setDescriptions(item.description);
          setPrice(item.price);
        }
      });
  };
  const StyledTableRow = styled(TableRow)(({ theme }) => ({
    "&:nth-of-type(odd)": {
      backgroundColor: theme.palette.action.hover,
    },
    "&:last-child td, &:last-child th": {
      border: 0,
    },
  }));

  const handleClickOpenModalUpdateMeal = () => {
    setUpdateMealModal(true);
    setOpenModalUpdate(true);
  };

  const updateMembership = (event) => {
    setIsBtnLoading(true);
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update this subscription?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(
          "https://gymerls-staging-server.vercel.app/api/update-membership",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              name: data.get("membership"),
              description: data.get("description"),
              price: data.get("price"),
              id: membershipId,
            }),
          }
        )
          .then((res) => res.json())
          .then((result) => {
            subscriptionLog(
              localStorage.getItem("username"),
              "Update",
              "subscription",
              data.get("membership")
            );
            Swal.fire({
              title: "Subscription successfully updated!",
              icon: "success",
              showConfirmButton: false,
              timer: 1500,
            }).then(function () {
              setOpenModalUpdate(false);
              setIsBtnLoading(false);
              window.location.reload(false);
            });
          });
      } else {
        setIsBtnLoading(false);
      }
    });
  };
  const handleCloseModalMembership = () => {
    setPrice();
    setMembership("");
    setDescriptions("");
    setCreateReadyMealButtonIsDisabled(false);
  };

  const changeMembershipStatus = (status, id, name) => {
    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update the status to this subscription?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        setIsBtnLoading(true);
        handleMembershipStatus(status, id, name);
      } else {
        window.location.reload(false);
      }
    });
  };

  const handleMembershipStatus = (status, id, name) => {
    fetch(
      "https://gymerls-staging-server.vercel.app/api/update-membership-status",
      {
        method: "PATCH",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          status: status ? 1 : 0,
          id: id,
        }),
      }
    )
      .then((res) => res.json())
      .then((data) => {
        if (status === 1) {
          subscriptionLog(
            localStorage.getItem("username"),
            "Change",
            "status to enable of ",
            name
          );
        } else {
          subscriptionLog(
            localStorage.getItem("username"),
            "Change",
            "status to disable of ",
            name
          );
        }

        Swal.fire({
          title: "User status successfully updated!",
          icon: "success",
          showConfirmButton: false,
          timer: 1500,
        }).then(function () {
          setIsBtnLoading(false);
          window.location.reload(false);
        });
      });
  };

  const getIpAddress = (callback) => {
    fetch("https://api.ipify.org?format=json")
      .then((response) => response.json())
      .then((data) => callback(data.ip))
      .catch((error) => console.log(error));
  };

  const subscriptionLog = (author, action, event, type) => {
    getIpAddress(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/insert-log", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: author,
          event_info: `${action} - ${event} "${type}"`,
          ip_address: callback,
          platform: window.navigator.userAgentData.platform,
        }),
      }).catch((error) => console.log(error));
    });
  };

  const downloadPdf = () => {
    const doc = new jsPDF();
    doc.text("List of Subscription", 20, 10);
    doc.autoTable({ html: "#usersTable" });
    doc.save("Subscription.pdf");
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
          <Grid container spacing={1}>
            <Grid item xs={12} md={6}>
              <Button variant="outlined" onClick={handleClickOpen}>
                Create SUBSCRIPTION
              </Button>
            </Grid>

            <Grid item xs={12} display={"flex"}>
              <Grid>
                <Button onClick={() => downloadPdf()} startIcon={<PrintIcon />}>
                  Export as PDF
                </Button>
              </Grid>
            </Grid>
          </Grid>

          {/* CREATE NEW SUBSCRIPTION */}
          <Dialog
            fullScreen={fullScreen}
            open={open}
            aria-labelledby="responsive-dialog-title"
          >
            <DialogContent>
              {/* {hasMealPlan ? ( */}
              <form onSubmit={createMembership}>
                <DialogTitle id="responsive-dialog-title">
                  CREATE SUBSCRIPTION
                </DialogTitle>
                <DialogContent>
                  <DialogContentText>
                    Fill up all fields, type <strong>n/a</strong> if not
                    applicable.
                  </DialogContentText>
                  <Divider />

                  <TextField
                    id="membership"
                    name="membership"
                    label="Membership"
                    fullWidth
                    multiline
                    sx={{ marginBottom: ".5rem" }}
                    required
                    value={membership}
                    onChange={(e) => {
                      setMembership(e.target.value);
                    }}
                    helperText="Membership must be 5 characters and above "
                  />
                  <DialogContentText
                    sx={{ marginBottom: ".5rem" }}
                  ></DialogContentText>
                  <TextField
                    id="description"
                    name="description"
                    label="Descriptions"
                    fullWidth
                    multiline
                    value={descriptions}
                    onChange={(e) => {
                      setDescriptions(e.target.value);
                    }}
                    sx={{ marginBottom: "1rem" }}
                    required
                  />

                  <TextField
                    placeholder="0"
                    type="number"
                    required
                    id="price"
                    fullWidth
                    name="price"
                    margin="normal"
                    value={price}
                    label="Price"
                    sx={{ marginBottom: "1rem" }}
                    InputProps={{
                      startAdornment: (
                        <InputAdornment
                          position="start"
                          sx={{ marginLeft: ".3rem" }}
                        >
                          ₱
                        </InputAdornment>
                      ),
                    }}
                    onChange={(e) => {
                      setPrice(e.target.value);
                    }}
                  />

                  <DialogActions sx={{ pt: "1.5rem", pb: "0rem" }}>
                    <Button
                      variant="contained"
                      color="error"
                      onClick={handleClose}
                    >
                      CANCEL
                    </Button>
                    <LoadingButton
                      variant="contained"
                      disabled={createReadyMealButtonIsDisabled}
                      loading={isBtnLoading}
                      type="submit"
                    >
                      <span>CREATE</span>
                    </LoadingButton>
                  </DialogActions>
                </DialogContent>
              </form>
              {/* ) : (
                <form></form>
              )} */}
            </DialogContent>
          </Dialog>
          {/* DATA SUBSCRIPTIONS*/}

          <Paper sx={{ width: "100%", overflow: "hidden" }} elevation={3}>
            <TableContainer sx={{ maxHeight: 700 }}>
              <Table stickyHeader aria-label="sticky table">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>PRICE</TableCell>

                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>STATUS</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ACTIONS
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      CREATED-BY
                    </TableCell>
                  </TableRow>
                </TableHead>
                {subscriptionnoData ? (
                  <TableBody>
                    {filteredMembership
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((meals) => {
                        const pesoFormat = new Intl.NumberFormat("fil-PH", {
                          style: "currency",
                          currency: "PHP",
                        }).format(meals.price);

                        return (
                          <StyledTableRow hover tabIndex={-1} key={meals.id}>
                            <TableCell>{meals.name}</TableCell>
                            <TableCell>{pesoFormat}</TableCell>
                            <TableCell>{meals.description}</TableCell>
                            <TableCell>
                              <Switch
                                onChange={(e) => {
                                  changeMembershipStatus(
                                    e.target.checked,
                                    meals.id,
                                    meals.name
                                  );
                                }}
                                defaultChecked={meals.status ? true : false}
                              />
                            </TableCell>
                            <TableCell align="center">
                              <Button
                                onClick={() => {
                                  getMembershipData(meals.id);
                                }}
                                variant="text"
                                color="success"
                                sx={{ marginRight: ".5rem" }}
                              >
                                Update
                              </Button>
                              <Button
                                variant="text"
                                color="warning"
                                onClick={() => {
                                  deleteMembership(meals.id, meals.name);
                                }}
                              >
                                Delete
                              </Button>
                            </TableCell>
                            <TableCell align="center">
                              {meals.created_by}
                            </TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                ) : (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={7}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                )}
              </Table>
            </TableContainer>
            <TablePagination
              rowsPerPageOptions={[10, 15, 20]}
              component="div"
              count={countLength}
              rowsPerPage={rowsPerPage}
              page={page}
              onPageChange={handleChangePage}
              onRowsPerPageChange={handleChangeRowsPerPage}
            />
            <Dialog
              fullScreen={fullScreen}
              open={openModalUpdate}
              aria-labelledby="responsive-dialog-title"
            >
              <DialogContent>
                {updateMealModal ? (
                  <form onSubmit={updateMembership}>
                    <DialogTitle id="responsive-dialog-title">
                      UPDATE SUBSCRIPTION
                    </DialogTitle>
                    <DialogContent>
                      <DialogContentText>
                        Fill up all fields, type <strong>n/a</strong> if not
                        applicable.
                      </DialogContentText>
                      <Divider />
                      <TextField
                        id="membership"
                        name="membership"
                        label="Membership"
                        fullWidth
                        multiline
                        sx={{ marginBottom: ".5rem" }}
                        required
                        value={membership}
                        onChange={(e) => {
                          setMembership(e.target.value);
                        }}
                        helperText="Membership must be 5 characters and above "
                      />
                      <DialogContentText
                        sx={{ marginBottom: ".5rem" }}
                      ></DialogContentText>
                      <TextField
                        id="description"
                        name="description"
                        label="Descriptions"
                        fullWidth
                        multiline
                        value={descriptions}
                        onChange={(e) => {
                          setDescriptions(e.target.value);
                        }}
                        sx={{ marginBottom: "1rem" }}
                        required
                      />

                      <TextField
                        placeholder="0"
                        type="number"
                        required
                        id="price"
                        fullWidth
                        name="price"
                        margin="normal"
                        value={price}
                        label="Price"
                        sx={{ marginBottom: "1rem" }}
                        InputProps={{
                          startAdornment: (
                            <InputAdornment
                              position="start"
                              sx={{ marginLeft: ".3rem" }}
                            >
                              ₱
                            </InputAdornment>
                          ),
                        }}
                        onChange={(e) => {
                          setPrice(e.target.value);
                        }}
                      ></TextField>

                      <DialogActions sx={{ pt: "1.5rem", pb: "0rem" }}>
                        <Button
                          variant="contained"
                          color="error"
                          onClick={handleCloseUpdateMembership}
                        >
                          CANCEL
                        </Button>
                        <LoadingButton
                          variant="contained"
                          // loading={isBtnLoading}
                          disabled={createReadyMealButtonIsDisabled}
                          type="submit"
                        >
                          <span>UPDATE</span>
                        </LoadingButton>
                      </DialogActions>
                    </DialogContent>
                  </form>
                ) : (
                  <form></form>
                )}
              </DialogContent>
            </Dialog>

            {/* PDF */}
            <TableContainer sx={{ maxHeight: 700, display: "none" }}>
              <Table stickyHeader aria-label="sticky table" id="usersTable">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>PRICE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      CREATED_BY
                    </TableCell>
                  </TableRow>
                </TableHead>
                {subscriptionnoData ? (
                  <TableBody>
                    {filteredMembership
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((meals) => {
                        return (
                          <StyledTableRow hover tabIndex={-1} key={meals.id}>
                            <TableCell>{meals.name}</TableCell>
                            <TableCell>{meals.price}</TableCell>
                            <TableCell>{meals.description}</TableCell>
                            <TableCell>{meals.created_by}</TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                ) : (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={3}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
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

export default Membership;
