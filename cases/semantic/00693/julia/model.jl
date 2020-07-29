#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 1.0
    S2 = 1.5e-5 / C
    k3 = 1.5
    S1 = 1e-5 / C
    S4 = 2.25 / C
    k1 = 0.015
    reaction1 = C * k1 * S1
    k2 = 0.5
    S3 = 1e-5 / C
    reaction2 = C * k2 * S3
    S2_proc = k2 * S3 + (-1.0) * k1 * S1
    
    # save results

    return (
        [
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
            S1,
            k1,
            k2,
            k3,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,S1,k1,k2,k3,) = p.static
    (S2_,S3_,) = u 

    # Heta rules
    S2 = S2_ / C
    S4 = k3 * S1
    reaction1 = C * k1 * S1
    S3 = S3_ / C
    reaction2 = C * k2 * S3
    S2_proc = k2 * S3 + (-1.0) * k1 * S1
    
    #p.static .= [C,S1,k1,k2,k3,]
    du .= [
      S2_proc*C,  # dS2_/dt
      reaction1-reaction2,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,S1,k1,k2,k3,) = integrator.p.static
        (S2_,S3_,) = u

        # Heta rules
        S2 = S2_ / C
        S4 = k3 * S1
        reaction1 = C * k1 * S1
        S3 = S3_ / C
        reaction2 = C * k2 * S3
        S2_proc = k2 * S3 + (-1.0) * k1 * S1
        
        # calculate amounts
        C_ = C
        S1_ = S1 * C
        S4_ = S4 * C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k1_ = k1
        k2_ = k2
        k3_ = k3
        S2_proc_ = S2_proc

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00693 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00693 = x00693
)
tasks = ()

export models, tasks

end
